require 'cybersource_rest_client'
require_relative './CreatePaymentInstrument.rb'
require_relative '../../../Data/Configuration.rb'

# * This is a sample code to call PaymentInstrumentApi,
# * Retrieve an Payment Instrument
# * Include the profile_id and Payment Id in the GET request to retrieve payment instrument.

public
class PaymentInstrumentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PaymentInstrumentsApi.new(api_client, config)

    # Calling CreatePaymentInstrument sample code
    response = CreatePaymentIdentifier.new.main
    resp = JSON.parse(response)
    id = resp['id']

    data, status_code, headers = api_instance.tms_v1_paymentinstruments_token_id_get(profile_id, id)
    puts data, status_code, headers
    data
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    PaymentInstrumentIdentifier.new.main
  end
end
