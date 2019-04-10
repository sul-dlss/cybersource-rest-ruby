  require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetConversionDetailTransactions
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    start_time = "2019-03-21T00:00:00.0Z"
    end_time="2019-03-21T23:00:00.0Z"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ConversionDetailsApi.new(api_client, config)

    opts = {}
    opts[:'organization_id'] = "testrest"

    data, status_code, headers = api_instance.get_conversion_detail(start_time,end_time)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetConversionDetailTransactions.new.main
end


