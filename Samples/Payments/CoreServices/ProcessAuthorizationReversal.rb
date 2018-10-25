require 'cyberSource_client'
require_relative './ProcessPayment.rb'

# * This is a sample code to call ReversalApi,
# * Process an Authorization Reversal
# * Include the payment ID in the POST request to reverse the payment amount.

public
class AuthReversal
  def main
    request = CyberSource::AuthReversalRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::ReversalApi.new(apiClient)

    # Calling ProcessPayment Sample code 
    capture_flag = false
    response = CreatePayment.new.main(capture_flag)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_reversal"
    request.client_reference_information = clientReferenceInformation

    reversalInformation = CyberSource::V2paymentsidreversalsReversalInformation.new
    reversalInformation.reason = "testing"

    amountDetails = CyberSource::V2paymentsidreversalsReversalInformationAmountDetails.new
    amountDetails.total_amount = "102.21"

    reversalInformation.amount_details = amountDetails
    request.reversal_information = reversalInformation
    
    data, status_code, headers = apiInstance.auth_reversal(response.id, request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  AuthReversal.new.main
end
