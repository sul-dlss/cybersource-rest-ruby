require 'cyberSource_client'

# * This is a sample code to call InstrumentIdentifierApi,
# * Process an Instrument Identifier
# * Include the profileId in the POST request to create a new instrument identifier.

public
class CreateInstrumentIdentifier
  def main
    profileId = '93B32398-AD51-4CC2-A682-EA3E93614EB1'

    request = CyberSource::InlineResponse2007.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::InstrumentIdentifierApi.new(apiClient)

    instrumentCardInfo = CyberSource::InstrumentidentifiersCard.new
    instrumentCardInfo.number = "1234567890987654"
    request.card = instrumentCardInfo

    instrumentProcessingInformation = CyberSource::InstrumentidentifiersProcessingInformation.new
    instrumentProcessingInformationAuth = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptions.new
    instrumentProcessingInformationInitiator = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptionsInitiator.new
    instrumentProcessingInformationMerchantInitiator = CyberSource::InstrumentidentifiersProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.new
    instrumentProcessingInformationMerchantInitiator.previous_transaction_id = "123456789012345"
    instrumentProcessingInformationInitiator.merchant_initiated_transaction = instrumentProcessingInformationMerchantInitiator
    instrumentProcessingInformationAuth.initiator = instrumentProcessingInformationInitiator
    request.processing_information = instrumentProcessingInformation

    options = {}
    options[:'body'] = request

    data, status_code, headers = apiInstance.instrumentidentifiers_post(profileId, options)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  CreateInstrumentIdentifier.new.main
end