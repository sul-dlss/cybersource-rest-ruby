require 'cybersource_rest_client'
require_relative '../../../Data/Configuration.rb'

public
class GetIndividualBatchFile
  def main()
    id = "Owcyk6pl"
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::TransactionBatchApi.new(api_client, config)
    data, status_code, headers = api_instance.pts_v1_transaction_batches_id_get(id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetIndividualBatchFile.new.main
end


