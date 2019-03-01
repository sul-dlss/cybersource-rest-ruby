require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetReportBasedOnReportid
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    id = "79642c43-2368-0cd5-e053-a2588e0a7b3c"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportsApi.new(api_client, config)

    opts = {}
    opts[:'organization_id'] = "testrest"

    data, status_code, headers = api_instance.get_report_by_report_id(id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetReportBasedOnReportid.new.main
end


