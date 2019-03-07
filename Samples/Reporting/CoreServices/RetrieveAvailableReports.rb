require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class RetrieveAvailableReports
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    start_time = "2018-10-01T00:00:00.0Z"
    end_time = "2018-10-30T23:59:59.0Z"
    time_query_type = "executedTime"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportsApi.new(api_client, config)
    opts = {}
    opts[:'reportMimeType'] = "text/csv"
    data, status_code, headers = api_instance.search_reports(start_time, end_time, time_query_type, opts)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  RetrieveAvailableReports.new.main
end


