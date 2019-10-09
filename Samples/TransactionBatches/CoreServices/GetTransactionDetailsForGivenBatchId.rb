require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetTransactionDetailsForGivenBatchId
    def main()
	    file_path = "resource//BatchDetailsReport."
    	id = "20190110"
        opts = {}
        
        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::TransactionBatchesApi.new(api_client, config)

        data, status_code, headers = api_instance.get_transaction_batch_details(id, opts)
        puts data, status_code, headers

	    if data != nil
		    file_extension = headers['Content-Type']
		    file_path = file_path + file_extension[-3..file_extension.length]
		    f = File.new(file_path,"w")
		    f.write(data)
		    f.close
		    puts "File downloaded at the below location:\n" + File.expand_path(file_path)
	    end
    rescue StandardError => err
        puts err.message
    end
	
    GetTransactionDetailsForGivenBatchId.new.main
end
