require 'cyberSource_client'
require_relative 'CapturePayment.rb'

# * This is a sample code to call VoidApi,
# * Void a Capture
# * Include the Capture ID in the POST request to cancel the Payment Capture.

public
class VoidCapture
  def main
    request = CyberSource::VoidCaptureRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)

    # Calling Capturepayment Sample code 
    response = CapturePayment.new.main

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_capture_void"
    request.client_reference_information = clientReferenceInformation
    data, status_code, headers = apiInstance.void_capture(request, response.id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoidCapture.new.main
end
