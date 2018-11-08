require 'cybersource_rest_client'
require_relative '../../../Data/Configuration.rb'

public
class GetSubscriptionForReportName
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    report_Name = "TRR_1383"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportSubscriptionsApi.new(api_client, config)
    data, status_code, headers = api_instance.get_subscription(report_Name)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetSubscriptionForReportName.new.main
end


