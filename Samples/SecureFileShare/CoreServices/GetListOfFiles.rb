require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetListOfFiles
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    start_date = "2018-10-20"
    end_date = "2018-10-30"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::SecureFileShareApi.new(api_client, config)
    opts = {}
    opts[:'organization_id'] = "testrest"
    data, status_code, headers = api_instance.get_file_detail(start_date, end_date, opts)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetListOfFiles.new.main
end


