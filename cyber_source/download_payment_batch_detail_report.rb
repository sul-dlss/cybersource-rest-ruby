# frozen_string_literal: true

require 'cybersource_rest_client'
require 'folio_client'
require 'csv'
require 'date'
require 'json'

# class to download the PaymentbatchDetailReport from CyberSource
class DownloadPaymentBatchDetailReport
  attr_accessor :date

  CONFIGURATION_DICTIONARY = {
    merchantID: 'wfgsulair',
    runEnvironment: "cybersource.environment.#{ENV.fetch('CYBS_ENV', 'production')}",
    timeout: 3000,
    authenticationType: 'http_signature',
    enableLog: true,
    merchantKeyId: ENV.fetch('MERCHANT_KEY_ID', nil),
    merchantsecretKey: ENV.fetch('MERCHANT_SECRET_KEY', nil),
    logDirectory: 'harvestlog',
    logFilename: 'cybs'
  }.freeze

  def initialize(date)
    # Date format: e.g. '2001-02-03'
    @date = date ? Date.parse(date) : Date.today
  end

  def year_or_prev(date)
    date.month == 1 ? date.prev_year.year : date.year
  end

  def main
    credits = []

    first_day = Date.new(year_or_prev(@date), @date.prev_month.month, 1)
    last_day = Date.new(year_or_prev(@date), @date.prev_month.month, -1)

    (first_day..last_day).each do |date|
      report_date = date.strftime('%Y-%m-%d')
      begin
        data, status_code, headers = download_report(report_date)
        puts report_date, status_code, headers, data
      rescue StandardError => e
        puts report_date
        puts e.message
        next
      end
      next unless data

      data.each_line.with_index do |batch_detail, index|
        if index > 1
          user_id = batch_detail.split(',')[4]
          paid = batch_detail.split(',')[8]
          paydate = batch_detail.split(',')[12]&.chomp

          begin
            accounts = folio_client.get('/accounts', { query: "userId==#{user_id}" })
            puts accounts
          rescue Exception => e
            puts e.message
            next
          end

          if accounts && (accounts['totalRecords']).positive?
            accounts['accounts'].each do |account|
              account_date = Date.parse(account['metadata']['createdDate'])
              payment_date = Date.parse(paydate)

              unless (account_date == payment_date) && (account['amount'].to_f == paid.to_f) && (account['paymentStatus']['name'] == 'Paid fully')
                next
              end

              payload = {
                paydate: paydate,
                user_id: user_id,
                folio_payment_id: account['id'],
                library: account['feeFineOwner'],
                reason: account['feeFineType'],
                paid: paid
              }

              credits.push(payload)
            end
          end
        end
      end
      puts credits
      sleep(ENV.fetch('SLEEP', 2)&.to_i)
    end
    credits.any? && CSV.open('files/credits.csv', 'w+') do |csv|
      csv << credits.first.keys
      credits.each do |credit|
        csv << credit.values
      end
    end
  rescue StandardError => e
    puts e.message
    puts e.backtrace
  end

  def download_report(report_date)
    CyberSource::ReportDownloadsApi.new(
      CyberSource::ApiClient.new, CONFIGURATION_DICTIONARY.transform_keys(&:to_s)
    ).download_report(
      report_date,
      'PaymentBatchDetailReport_Daily_Classic', organization_id: 'wfgsulair'
    )
  end

  def folio_client
    FolioClient.configure(
      url: ENV.fetch('OKAPI_URL', 'http://okapi:9130'),
      login_params: {
        'username' => ENV.fetch('APP_USER', nil),
        'password' => ENV.fetch('APP_PASSWORD', nil)
      },
      okapi_headers: { 'X-Okapi-Tenant' => 'sul', 'User-Agent' => 'FolioApiClient' }
    )
  end
end
