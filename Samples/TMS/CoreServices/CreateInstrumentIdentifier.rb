require 'cyberSource_client'

# * This is a sample code to call InstrumentIdentifierApi,
# * Process an Instrument Identifier
# * Include the profile_id in the POST request to create a new instrument identifier.

public
class CreateInstrumentIdentifier
  def main
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'

    request = CyberSource::InlineResponse2007.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client)

    instrument_card_info = CyberSource::InstrumentidentifiersCard.new
    instrument_card_info.number = "1234567890123"
    request.card = instrument_card_info

    instrument_processing_information = CyberSource::InstrumentidentifiersProcessingInformation.new
    instrument_processing_information_auth = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptions.new
    instrument_processing_information_initiator = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptionsInitiator.new
    instrument_processing_information_merchant_initiator = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.new
    instrument_processing_information_merchant_initiator.previous_transaction_id = "123456789012345"
    instrument_processing_information_initiator.merchant_initiated_transaction = instrument_processing_information_merchant_initiator
    instrument_processing_information_auth.initiator = instrument_processing_information_initiator
    request.processing_information = instrument_processing_information

    options = {}
    options[:'body'] = request

    data, status_code, headers = api_instance.instrumentidentifiers_post(profile_id, options)
    puts data, status_code, headers
    data
  rescue StandardError => err
    puts err.message
  end
  CreateInstrumentIdentifier.new.main
end