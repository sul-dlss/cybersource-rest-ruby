require 'cyberSource_client'
require_relative 'ProcessPayment.rb'

# * This is a sample code to call RefundApi,
# * Refund a Payment
# * Include the payment ID in the POST request to refund the payment.

public
class RefundPayment
  def main
    request = CyberSource::RefundPaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::RefundApi.new(apiClient)

    # Calling CreatePayment Sample code 
    capture_flag = true
    response = CreatePayment.new.main(capture_flag)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_refund_payment"
    request.client_reference_information = clientReferenceInformation

    orderInformation = CyberSource::V2paymentsOrderInformation.new
    amountDetails = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountDetails.total_amount = "102.21"
    amountDetails.currency ="USD"
    orderInformation.amount_details = amountDetails
    request.order_information = orderInformation

    data, status_code, headers = apiInstance.refund_payment(request, response.id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  RefundPayment.new.main
end
