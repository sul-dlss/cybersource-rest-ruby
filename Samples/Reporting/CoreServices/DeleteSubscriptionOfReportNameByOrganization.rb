require 'cybersource_rest_client'
require_relative '../../../Data/Configuration.rb'

public
class DeleteSubscriptionOfReportNameByOrganization
  def main(report_name)
    config = MerchantConfiguration.new.merchantConfigProp()
    if report_name == nil
      report_name = "testrest_subcription_v1"
    end
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportSubscriptionsApi.new(api_client, config)
    data, status_code, headers = api_instance.delete_subscription(report_name)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    DeleteSubscriptionOfReportNameByOrganization.new.main("testrest_subcription_v1")
  end
end


