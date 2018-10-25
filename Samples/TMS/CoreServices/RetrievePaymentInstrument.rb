require 'cyberSource_client'
require_relative './CreatePaymentInstrument.rb'

# * This is a sample code to call PaymentInstrumentApi,
# * Retrieve an Payment Instrument
# * Include the profile_id and Payment Id in the GET request to retrieve payment instrument.

public
class PaymentInstrumentIdentifier
  def main
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PaymentInstrumentApi.new(api_client)

    # Calling CreatePaymentInstrument sample code
    response = CreatePaymentIdentifier.new.main

    data, status_code, headers = api_instance.paymentinstruments_token_id_get(profile_id, response.id)
    puts data, status_code, headers
    data
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  PaymentInstrumentIdentifier.new.main
end
