require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class DownloadFileWithFileIdentifier
  def main()
    file_path = "resource//DownloadFileWithFileIdentifier.csv"
    config = MerchantConfiguration.new.merchantConfigProp()
    file_id = "VFJSUmVwb3J0LTc4NTVkMTNmLTkzOTgtNTExMy1lMDUzLWEyNTg4ZTBhNzE5Mi5jc3YtMjAxOC0xMC0yMA=="
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::SecureFileShareApi.new(api_client, config)
    opts = {}
    opts[:'organization_id'] = "testrest"
    data, status_code, headers = api_instance.get_file(file_id, opts)
    puts data, status_code, headers
    if data != nil
      f = File.new(file_path,"w")
      f.write(data)
      f.close
      puts "File downloaded at the below location:\n" + File.expand_path(file_path)
    end
  rescue StandardError => err
    puts err.message
  end
  DownloadFileWithFileIdentifier.new.main
end


