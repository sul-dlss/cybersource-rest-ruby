require 'cyberSource_client'

# * This is a sample code to call KeyGenerationApi,
# * Generate Key - with Encryption Type as none
# * GeneratePublickey method will create a new Public Key and Key ID

public
class NoEncGeneratekey
  def main
    request = CyberSource::KeyParameters.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::KeyGenerationApi.new(apiClient)
    request.encryption_type = "None"

    data, status_code, headers = apiInstance.generate_public_key(request)
    puts data, status_code, headers
	data
  rescue StandardError => err
    puts err.message
  end
  NoEncGeneratekey.new.main
end