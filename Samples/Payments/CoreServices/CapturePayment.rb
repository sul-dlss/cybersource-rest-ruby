require 'cyberSource_client'
require_relative './ProcessPayment.rb'

# * This is a sample code to call CaptureApi,
# * capture a Payment
# * Include the payment ID in the POST request to Capture the payment.

public
class CapturePayment
  def main
    request = CyberSource::CapturePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::CaptureApi.new(apiClient)
    
    # Calling ProcessPayment Sample code 
    capture_flag = false
    response = CreatePayment.new.main(capture_flag)
    

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_capture"
    request.client_reference_information = clientReferenceInformation

    orderInformation = CyberSource::V2paymentsOrderInformation.new
    amountDetails = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountDetails.total_amount = "102.21"
    amountDetails.currency ="USD"
    orderInformation.amount_details = amountDetails
    request.order_information = orderInformation

    data, status_code, headers = apiInstance.capture_payment(request, response.id)
    puts data, status_code, headers
    data
  rescue StandardError => err
    puts err.message
  end
  CapturePayment.new.main
end
