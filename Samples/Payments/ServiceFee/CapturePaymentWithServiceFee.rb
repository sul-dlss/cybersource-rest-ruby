require 'cybersource_rest_client'
require_relative './ProcessPaymentWithServiceFee.rb'
require_relative '../../../Data/Configuration.rb'
 
# * This is a sample code to call CaptureApi,
# * capture a Payment
# * Include the payment ID in the POST request to Capture the payment.

public
class CapturePaymentWithServiceFee
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::CapturePaymentRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::CaptureApi.new(api_client, config)
    
    # Calling ProcessPayment Sample code 
    capture_flag = false
    response = CreatePaymentWithServiceFee.new.main(capture_flag)
    resp = JSON.parse(response)
    id = resp['id']

    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_capture"
    request.client_reference_information = client_reference_information

    order_information = CyberSource::Ptsv2paymentsOrderInformation.new
    amount_details = CyberSource::Ptsv2paymentsOrderInformationAmountDetails.new
    amount_details.total_amount = "2325.00"
    amount_details.currency ="USD"
	amount_details.service_fee_amount = "30"
    order_information.amount_details = amount_details
    request.order_information = order_information
    resp = JSON.parse(response)
    data, status_code, headers = api_instance.capture_payment(request, id)
    puts data, status_code, headers
    data
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    CapturePaymentWithServiceFee.new.main
  end
end
