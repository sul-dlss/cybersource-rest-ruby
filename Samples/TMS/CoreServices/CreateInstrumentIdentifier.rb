require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call InstrumentIdentifierApi,
# * Process an Instrument Identifier
# * Include the profile_id in the POST request to create a new instrument identifier.

public
class CreateInstrumentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'

    request = CyberSource::CreateInstrumentIdentifierRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client, config)

    instrument_card_info = CyberSource::Tmsv1instrumentidentifiersCard.new
    instrument_card_info.number = "1234567890123"
    request.card = instrument_card_info

    data, status_code, headers = api_instance.create_instrument_identifier(profile_id, request)
    puts data, status_code, headers
    data
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    CreateInstrumentIdentifier.new.main
  end
end