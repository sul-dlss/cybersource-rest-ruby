require 'cybersource_rest_client'
require_relative './CreateInstrumentIdentifier.rb'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call Retrieve All Payment Identifier From Instrument,
# * Retrieve an Instrument Identifier
# * Include the profile_id in the GET request to Retrieve All Payment Identifier From Instrument.

public
class RetrieveAllPaymentIdentifierFromInstrument
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client, config)

    # Calling CreatePaymentInstrument sample code
    response = CreateInstrumentIdentifier.new.main
    resp = JSON.parse(response)
    id = resp['id']

    data, status_code, headers = api_instance.get_all_payment_instruments(profile_id, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    RetrieveAllPaymentIdentifierFromInstrument.new.main
  end
end
