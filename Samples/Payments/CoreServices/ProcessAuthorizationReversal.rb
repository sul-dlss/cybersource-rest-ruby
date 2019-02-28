require 'cybersource_rest_client'
require_relative './ProcessPayment.rb'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call ReversalApi,
# * Process an Authorization Reversal
# * Include the payment ID in the POST request to reverse the payment amount.

public
class AuthReversal
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::AuthReversalRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReversalApi.new(api_client, config)

    # Calling ProcessPayment Sample code 
    capture_flag = false
    response = CreatePayment.new.main(capture_flag)
    resp = JSON.parse(response)
    id = resp['id']

    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_reversal"
    request.client_reference_information = client_reference_information

    reversal_information = CyberSource::Ptsv2paymentsidreversalsReversalInformation.new
    reversal_information.reason = "testing"

    amount_details = CyberSource::Ptsv2paymentsidreversalsReversalInformationAmountDetails.new
    amount_details.total_amount = "102.21"

    reversal_information.amount_details = amount_details
    request.reversal_information = reversal_information
    
    data, status_code, headers = api_instance.auth_reversal(id, request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    AuthReversal.new.main
  end
end
