require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetReportDefinition
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    report_definition_name = "AcquirerExceptionDetailClass"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportDefinitionsApi.new(api_client, config)
    data, status_code, headers = api_instance.get_resource_info_by_report_definition(report_definition_name)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetReportDefinition.new.main
end