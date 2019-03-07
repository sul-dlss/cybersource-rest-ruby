require 'cybersource_rest_client'
require_relative 'CapturePayment.rb'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call VoidApi,
# * Void a Capture
# * Include the Capture ID in the POST request to cancel the Payment Capture.

public
class VoidCapture
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::VoidCaptureRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::VoidApi.new(api_client, config)

    # Calling Capturepayment Sample code 
    response = CapturePayment.new.main
    resp = JSON.parse(response)
    id = resp['id']

    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_capture_void"
    request.client_reference_information = client_reference_information
    data, status_code, headers = api_instance.void_capture(request, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    VoidCapture.new.main
  end
end
