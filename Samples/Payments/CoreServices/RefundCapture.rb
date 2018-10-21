require 'cyberSource_client'
require_relative 'CapturePayment.rb'

# * This is a sample code to call RefundApi,
# * Refund a capture
# * Include the payment ID in the POST request to refund the captured amount.

public
class RefundCapture
  def main
    request = CyberSource::RefundCaptureRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::RefundApi.new(apiClient)

    # Calling Capturepayment Sample code 
    response = CapturePayment.new.main
    
    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_refund_capture"
    request.client_reference_information = clientReferenceInformation
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    amountDetails = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountDetails.total_amount = "102.21"
    amountDetails.currency ="USD"
    orderInformation.amount_details = amountDetails
    request.order_information = orderInformation
    data, status_code, headers = apiInstance.refund_capture(request, response.id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  RefundCapture.new.main
end
