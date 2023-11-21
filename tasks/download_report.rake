# frozen_string_literal: true

desc 'download cybersource monthly report, date format [9999-99-99]'
task :download_report, [:date] do |_, args|
  require_relative '../cyber_source/download_payment_batch_detail_report'
  result = DownloadPaymentBatchDetailReport.new(args[:date])
  puts result.main
end

desc 'test mail'
task :mail do
  require 'date'
  require 'mail'

  namespace = "folio-#{ENV.fetch('STAGE', nil)}"
  options = { host: "mail.#{namespace}.svc.cluster.local",
              address: "mail.#{namespace}.svc.cluster.local",
              port: 587,
              domain: 'stanford.edu'
            }

  Mail.defaults do
    delivery_method :smtp, options
  end

  begin
    mail = Mail.new do
      from     'cardPaymentReporter@stanford.edu'
      to       ENV.fetch('EMAIL_REPORT_TO', 'sul-unicorn-devs@lists.stanford.edu')
      subject  "Card Payment Report #{Date.today.strftime('%m-%Y')}"
      body     File.read('files/credits.csv')
      add_file 'files/credits.csv'
    end

    mail.delivery_method :sendmail
    mail.deliver
  rescue Errno::ENOENT => e
    puts e
  end
end
