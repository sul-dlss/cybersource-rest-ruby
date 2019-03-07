require 'cybersource_rest_client'
require_relative 'ProcessPayment.rb'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call VoidApi,
# * Void a Refund
# * Include the refund ID in the POST request to cancel the Payment Refund.

public
class VoidRefund
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::VoidRefundRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::VoidApi.new(api_client, config)

    # Calling CreatePayment Sample code 
    capture_flag = true
    response = CreatePayment.new.main(capture_flag)
    resp = JSON.parse(response)
    id = resp['id']

    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_refund_void"
    request.client_reference_information = client_reference_information

    data, status_code, headers = api_instance.void_refund(request, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    VoidRefund.new.main
  end
end
