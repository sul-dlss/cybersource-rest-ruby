require 'cyberSource_client'

# * This is a sample code to call InstrumentIdentifierApi,
# * Update an Instrument Identifier
# * Include the profileId, tokenId in the POST request to create a instrument identifier.

public
class UpdateInstrumentIdentifier
  def main
    body = CyberSource::Body1.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::InstrumentIdentifierApi.new(apiClient)

    merchantInitiatedTransaction = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.new
    previousTransactionId = "123456789012345"
    merchantInitiatedTransaction.previous_transaction_id = previousTransactionId

    initiator = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptionsInitiator.new
    initiator.merchant_initiated_transaction = merchantInitiatedTransaction

    authorizationOptions = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptions.new
    authorizationOptions.initiator = initiator

    processingInformation = CyberSource::PaymentinstrumentsProcessingInformation.new
    processingInformation.authorization_options = authorizationOptions

    body.processing_information = processingInformation

    options = {}
    options[:'body'] =body

    tokenId = "7020000000000137654"
    profileId = "93B32398-AD51-4CC2-A682-EA3E93614EB1"


    data, status_code, headers = apiInstance.instrumentidentifiers_token_id_patch(profileId, tokenId, options)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  UpdateInstrumentIdentifier.new.main
end