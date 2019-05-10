require 'cybersource_rest_client'
require_relative './RetrieveInstrumentIdentifier.rb'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call InstrumentIdentifierApi,
# * Update an Instrument Identifier
# * Include the profile_id, token_id in the POST request to create a instrument identifier.

public
class UpdateInstrumentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    profile_id = "93B32398-AD51-4CC2-A682-EA3E93614EB1"

    body = CyberSource::UpdateInstrumentIdentifierRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client, config)

    # Calling RetrieveInstrumentIdentifier sample code
    response = RetrieveInstrumentIdentifier.new.main
    resp = JSON.parse(response)
    id = resp['id']

    merchant_initiated_transaction = CyberSource::TmsV1InstrumentIdentifiersPost200ResponseProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.new
    previous_transaction_id = "123456789012345"
    merchant_initiated_transaction.previous_transaction_id = previous_transaction_id

    initiator = CyberSource::TmsV1InstrumentIdentifiersPost200ResponseProcessingInformationAuthorizationOptionsInitiator.new
    initiator.merchant_initiated_transaction = merchant_initiated_transaction

    authorization_options = CyberSource::TmsV1InstrumentIdentifiersPost200ResponseProcessingInformationAuthorizationOptions.new
    authorization_options.initiator = initiator

    processing_information = CyberSource::TmsV1InstrumentIdentifiersPost200ResponseProcessingInformation.new
    processing_information.authorization_options = authorization_options

    body.processing_information = processing_information

    data, status_code, headers = api_instance.update_instrument_identifier(profile_id, id, body)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    UpdateInstrumentIdentifier.new.main
  end
end