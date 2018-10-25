require 'cyberSource_client'

# * This is a sample code to call InstrumentIdentifierApi,
# * Update an Instrument Identifier
# * Include the profile_id, token_id in the POST request to create a instrument identifier.

public
class UpdateInstrumentIdentifier
  def main

    token_id = "7020000000000137654"
    profile_id = "93B32398-AD51-4CC2-A682-EA3E93614EB1"

    body = CyberSource::Body1.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client)

    merchant_initiated_transaction = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.new
    previous_transaction_id = "123456789012345"
    merchant_initiated_transaction.previous_transaction_id = previous_transaction_id

    initiator = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptionsInitiator.new
    initiator.merchant_initiated_transaction = merchant_initiated_transaction

    authorization_options = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptions.new
    authorization_options.initiator = initiator

    processing_information = CyberSource::PaymentinstrumentsProcessingInformation.new
    processing_information.authorization_options = authorization_options

    body.processing_information = processing_information

    options = {}
    options[:'body'] =body

    data, status_code, headers = api_instance.instrumentidentifiers_token_id_patch(profile_id, token_id, options)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  UpdateInstrumentIdentifier.new.main
end