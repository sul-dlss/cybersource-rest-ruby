require 'cybersource_rest_client'
require_relative './CreateSearchRequest.rb'
require_relative '../../../Data/Configuration.rb'

public
class GetSearchResults
  def main()
    # id = "4862be87-e01d-427b-bc59-4783a3bcdb25"
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new

    # Calling CreateSearchRequest Sample code 
    response = CreateSearchRequest.new.main()

    api_instance = CyberSource::SearchTransactionsApi.new(api_client, config)
    data, status_code, headers = api_instance.get_search(response.search_id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetSearchResults.new.main
end
