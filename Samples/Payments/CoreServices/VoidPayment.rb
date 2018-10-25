require 'cyberSource_client'
require_relative 'ProcessPayment.rb'

# * This is a sample code to call VoidApi,
# * Void a Payment
# * Include the Payment ID in the POST request to cancel the Payment.

public
class VoidPayment
  def main
    request = CyberSource::VoidPaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)

    # Calling CreatePayment Sample code 
    capture_flag = true
    response = CreatePayment.new.main(capture_flag)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_payment_void"
    request.client_reference_information = clientReferenceInformation

    data, status_code, headers = apiInstance.void_payment(request, response.id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoidPayment.new.main
end
