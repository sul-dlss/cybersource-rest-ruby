require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetSearchResults
  def main()
	  id = "ee523a24-dec0-4db6-9efa-375f05b5e161"
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
