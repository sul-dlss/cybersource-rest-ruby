require 'cybersource_rest_client'
require_relative './RetrievePaymentInstrument.rb'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call PaymentInstrumentApi,
# * Delete an PaymentInstrument
# * Include the profile_id and payment Id in the DELETE request to delete a Payment instrument.

public
class RemovePaymentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PaymentInstrumentsApi.new(api_client, config)

    # Calling RetrievePaymentInstrument sample code
    response = PaymentInstrumentIdentifier.new.main
    resp = JSON.parse(response)
    id = resp['id']

    data, status_code, headers = api_instance.tms_v1_paymentinstruments_token_id_delete(profile_id, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    RemovePaymentIdentifier.new.main
  end
end
