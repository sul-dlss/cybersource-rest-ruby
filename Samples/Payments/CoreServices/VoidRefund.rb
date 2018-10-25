require 'cyberSource_client'
require_relative 'ProcessPayment.rb'

# * This is a sample code to call VoidApi,
# * Void a Refund
# * Include the refund ID in the POST request to cancel the Payment Refund.

public
class VoidRefund
  def main
    request = CyberSource::VoidRefundRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)

    # Calling CreatePayment Sample code 
    capture_flag = true
    response = CreatePayment.new.main(capture_flag)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_refund_void"
    request.client_reference_information = clientReferenceInformation

    data, status_code, headers = apiInstance.void_refund(request, response.id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoidRefund.new.main
end
