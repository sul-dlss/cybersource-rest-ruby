require 'cybersource_rest_client'
require 'csv'
require_relative '../../../Data/Configuration.rb'

public
class DownloadFileWithFileIdentifier
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    file_id = "RGVtb19SZXBvcnQtNzg1NWQxM2YtOTM5Ny01MTEzLWUwNTMtYTI1ODhlMGE3MTkyLnhtbC0yMDE4LTEwLTIw"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::SecureFileShareApi.new(api_client, config)
    opts = {}
    opts[:'organization_id'] = "testrest"
    data, status_code, headers = api_instance.get_file(file_id, opts)
    puts data, status_code, headers

    # Writing Response to CSV file
    CSV.open("..\\cybersource-rest-samples-ruby\\resource\\report_download_file_with_file_identifier.csv","a+") do |writeToCSV|
      if data != nil
        writeToCSV << [ data.to_s ]
      end
    end

  rescue StandardError => err
    puts err.message
  end
  DownloadFileWithFileIdentifier.new.main
end


