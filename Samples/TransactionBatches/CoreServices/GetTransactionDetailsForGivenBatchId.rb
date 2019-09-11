require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetTransactionDetailsForGivenBatchId
    def main()
		id = "12345"
        opts = {}
        opts[:"upload_date"] = "2019-05-01T12:00:00Z"
        opts[:"status"] = "REJECTED"

        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::TransactionBatchesApi.new(api_client, config)

        data, status_code, headers = api_instance.get_transaction_batch_details(id, opts)
        
		puts data, status_code, headers
    rescue StandardError => err
        puts err.message
    end
	
    GetTransactionDetailsForGivenBatchId.new.main
end
