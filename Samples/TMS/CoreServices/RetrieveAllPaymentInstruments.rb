require 'cyberSource_client'
require_relative './CreateInstrumentIdentifier.rb'

# * This is a sample code to call Retrieve All Payment Identifier From Instrument,
# * Retrieve an Instrument Identifier
# * Include the profile_id in the GET request to Retrieve All Payment Identifier From Instrument.

public
class RetrieveAllPaymentIdentifierFromInstrument
  def main
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client)

    # Calling CreatePaymentInstrument sample code
    response = CreateInstrumentIdentifier.new.main

    data, status_code, headers = api_instance.instrumentidentifiers_token_id_paymentinstruments_get(profile_id, response.id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  RetrieveAllPaymentIdentifierFromInstrument.new.main
end
