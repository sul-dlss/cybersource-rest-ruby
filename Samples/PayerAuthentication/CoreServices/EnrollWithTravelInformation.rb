require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call EnrollWithTravelInformation

public
class EnrollWithTravelInformation
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PayerAuthenticationApi.new(api_client, config)

    # Calling EnrollWithTravelInformation Sample code
    client_reference_information = CyberSource::Riskv1authenticationsClientReferenceInformation.new
    client_reference_information.code = "cybs_test"

    consumer_authentication_information = CyberSource::Riskv1authenticationsConsumerAuthenticationInformation.new
    consumer_authentication_information.authentication_transaction_id = 'gNNV7Q5e2rr2NOik5I30'

    request = CyberSource::CheckPayerAuthEnrollmentRequest.new
    request.client_reference_information = client_reference_information
    request.consumer_authentication_information = consumer_authentication_information
    
    data, status_code, headers = api_instance.check_payer_auth_enrollment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    EnrollWithTravelInformation.new.main
  end
end
