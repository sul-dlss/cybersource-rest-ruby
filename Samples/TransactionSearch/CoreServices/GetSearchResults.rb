require 'cybersource_rest_client'
require_relative '../../../Data/Configuration.rb'

public
class GetSearchResults
  def main()
	  id = "b922f51a-8f5c-491f-bf99-2470490ec887"
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new

    api_instance = CyberSource::SearchTransactionsApi.new(api_client, config)
    data, status_code, headers = api_instance.get_search(id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetSearchResults.new.main
end
