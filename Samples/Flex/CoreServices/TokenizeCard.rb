require 'cybersource_rest_client'
require_relative '../VerifyToken.rb'
require_relative '../KeyGenerationNoEnc.rb'
require_relative '../../../Data/Configuration.rb'

# * This is a sample code to call KeyGenerationApi which will return key and
# * TokenizationApi Returns a token representing the supplied card details.
# * to verify the token with the key generated.

public
class TokenizeCard
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::TokenizeRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::FlexTokenApi.new(api_client, config)
    key_generation_response = NoEncGeneratekey.new.main
    resp = JSON.parse(key_generation_response)
    request.key_id = resp['keyId']
    public_key = resp['der']['publicKey']

    card_info = CyberSource::Flexv1tokensCardInfo.new
    card_info.card_number = "5555555555554444"
    card_info.card_expiration_month = "03"
    card_info.card_expiration_year = "2031"
    card_info.card_type = "002"
    request.card_info =  card_info
    options = {}
    options[:'tokenize_request'] = request
    data, status_code, headers = api_instance.tokenize(options)
    verify = VerifyToken.new.verify(public_key, data)
    puts verify
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  TokenizeCard.new.main
end