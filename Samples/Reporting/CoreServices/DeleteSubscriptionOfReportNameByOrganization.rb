require 'cybersource_rest_client'
require_relative '../../../Data/Configuration.rb'

public
class DeleteSubscriptionOfReportNameByOrganization
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    report_name = "testrest_subcription_v1"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportSubscriptionsApi.new(api_client, config)
    data, status_code, headers = api_instance.delete_subscription(report_name)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  DeleteSubscriptionOfReportNameByOrganization.new.main()
end


