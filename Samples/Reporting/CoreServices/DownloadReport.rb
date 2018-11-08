require 'cybersource_rest_client'
require_relative '../../../Data/Configuration.rb'
require 'csv'

public
class DownloadReport
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    reportDate = "2018-09-02"
    reportName = "testrest_v2"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportDownloadsApi.new(api_client, config)
    opts = {}
    opts[:'organization_id'] = "testrest"

    data, status_code, headers = api_instance.download_report(reportDate, reportName, opts)
    puts data, status_code, headers
    # Writing Response to CSV file
    CSV.open("..\\cybersource-rest-samples-ruby\\resource\\report_download.csv","a+") do |writeToCSV|
      if data != nil
        writeToCSV << [ data.to_s ]
      end
    end

  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  DownloadReport.new.main
end


