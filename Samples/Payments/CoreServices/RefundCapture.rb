require 'cybersource_rest_client'
require_relative 'CapturePayment.rb'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call RefundApi,
# * Refund a capture
# * Include the payment ID in the POST request to refund the captured amount.

public
class RefundCapture
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::RefundCaptureRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::RefundApi.new(api_client, config)

    # Calling Capturepayment Sample code 
    response = CapturePayment.new.main
    resp = JSON.parse(response)
    id = resp['id']
    
    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_refund_capture"
    request.client_reference_information = client_reference_information
    order_information = CyberSource::Ptsv2paymentsOrderInformation.new
    amount_details = CyberSource::Ptsv2paymentsOrderInformationAmountDetails.new
    amount_details.total_amount = "102.21"
    amount_details.currency ="USD"
    order_information.amount_details = amount_details
    request.order_information = order_information
    data, status_code, headers = api_instance.refund_capture(request, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    RefundCapture.new.main
  end
end
