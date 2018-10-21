require 'cyberSource_client'
require_relative '../VerifyToken.rb'
require_relative '../KeyGenerationNoEnc.rb'

# * This is a sample code to call KeyGenerationApi which will return key and
# * TokenizationApi Returns a token representing the supplied card details.
# * to verify the token with the key generated.

public
class TokenizeCard
  def main
    request = CyberSource::TokenizeRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::TokenizationApi.new(apiClient)
    keyGenerationResponse = NoEncGeneratekey.new.main
    request.key_id = keyGenerationResponse.key_id

    cardInfo = CyberSource::Paymentsflexv1tokensCardInfo.new
    cardInfo.card_number = "5555555555554444"
    cardInfo.card_expiration_month = "03"
    cardInfo.card_expiration_year = "2031"
    cardInfo.card_type = "002"
    request.card_info =  cardInfo
    options = {}
    options[:'tokenize_request'] = request
    data, status_code, headers = apiInstance.tokenize(options)
    verify = VerifyToken.new.verify(keyGenerationResponse.der.public_key, data)
    puts verify
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  TokenizeCard.new.main
end