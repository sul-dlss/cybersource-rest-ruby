# frozen_string_literal: true

require 'cybersource_rest_client'
require 'csv'
require_relative '../helpers/write_to_csv'
require 'config'
Config.load_and_set_settings(Config.setting_files('config', ENV['STAGE']))

# class to download the PaymentbatchDetailReport from CyberSource
class DownloadPaymentBatchDetailReport
  def main
    d = Date.today
    first_day = Date.new(d.year, d.month - 1, 1)
    last_day = Date.new(d.year, d.month - 1, -1)

    api_instance = CyberSource::ReportDownloadsApi.new(CyberSource::ApiClient.new,
                                                       Settings.configurationDictionary.to_h.transform_keys(&:to_s))

    (first_day..last_day).each do |date|
      report_date = date.strftime('%Y-%m-%d')
      begin
      data, status_code, headers = api_instance.download_report(report_date, 'PaymentBatchDetailReport_Daily_Classic',
                                                                organization_id: 'wfgsulair')
      puts report_date, status_code, headers
      rescue StandardError => e
        puts report_date
        puts e.message
        next
      end
      WriteToCsv.file(data)
    end

  rescue StandardError => e
    puts e.message
  end

  DownloadPaymentBatchDetailReport.new.main
end
