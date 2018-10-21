require 'cyberSource_client'

# * This is a sample code to call ReversalApi,
# * Process an Authorization Reversal
# * Include the payment ID in the POST request to reverse the payment amount.

public
class AuthReversal
  def main
    id = '5337069774856224603522'
    request = CyberSource::AuthReversalRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::ReversalApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_reversal"
    request.client_reference_information = clientReferenceInformation

    reversalInformation = CyberSource::V2paymentsidreversalsReversalInformation.new
    # model file validation - reason field length as 3
    reversalInformation.reason = "tes" #ting"

    amountDetails = CyberSource::V2paymentsidreversalsReversalInformationAmountDetails.new
    amountDetails.total_amount = "102.21"

    reversalInformation.amount_details = amountDetails
    request.reversal_information = reversalInformation
    
    data, status_code, headers = apiInstance.auth_reversal(id, request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  AuthReversal.new.main
end
