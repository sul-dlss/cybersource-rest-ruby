require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetNetfundingInformationForAccountOrMerchant
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    start_time = "2019-03-21T00:00:00.0Z"
    end_time="2019-03-21T23:00:00.0Z"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::NetFundingsApi.new(api_client, config)

    opts = {}
    opts[:'organization_id'] = "testrest"
    opts[:'group_name'] = "groupName"

    data, status_code, headers = api_instance.get_net_funding_details(start_time,end_time)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetNetfundingInformationForAccountOrMerchant.new.main
end


