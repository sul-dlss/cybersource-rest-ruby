require 'cyberSource_client'
require_relative 'ProcessCredit.rb'

# * This is a sample code to call VoidApi,
# * Void a Credit
# * Include the Credit ID in the POST request to cancel the Payment Credit.

public
class VoidCredit
  def main
    id = "5336378279036983404106"
    request = CyberSource::VoidCreditRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::VoidApi.new(apiClient)

    # Calling CreateCredit Sample code 
    response = CreateCredit.new.main

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_credit_void"
    request.client_reference_information = clientReferenceInformation
    
    data, status_code, headers = apiInstance.void_credit(request, response.id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  VoidCredit.new.main
end
