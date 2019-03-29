require 'cybersource_rest_client'
require_relative './RefundEcheckPayment.rb'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call VoidApi,
# * Void a Payment
# * Include the Payment ID in the POST request to cancel the Payment.

public
class VoidEcheckRefund
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::VoidPaymentRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::VoidApi.new(api_client, config)

    # Calling CreatePayment Sample code 
    capture_flag = true
    response = RefundEcheckPayment.new.main
    resp = JSON.parse(response)
    id = resp['id']

    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_payment_void"
    request.client_reference_information = client_reference_information

    data, status_code, headers = api_instance.void_refund(request, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    VoidEcheckRefund.new.main
  end
end
