require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require 'csv'

public
class DownloadReport
  def main()
    file_path = "resource//DownloadReport.xml"
    config = MerchantConfiguration.new.merchantConfigProp()
    reportDate = "2018-09-02"
    reportName = "adhoc_report_2020"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportDownloadsApi.new(api_client, config)
    opts = {}
    opts[:'organization_id'] = "testrest"

    data, status_code, headers = api_instance.download_report(reportDate, reportName, opts)
    puts data, status_code, headers
    # Writing Response to XML file
    if data != nil
      f = File.new(file_path,"w")
      f.write(data)
      f.close
      puts "File downloaded at the below location:\n" + File.expand_path(file_path)
    end
  rescue StandardError => err
    puts err.message
  end
  DownloadReport.new.main
end


