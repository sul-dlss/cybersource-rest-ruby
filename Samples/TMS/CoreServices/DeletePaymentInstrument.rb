require 'cyberSource_client'
require_relative './RetrievePaymentInstrument.rb'

# * This is a sample code to call PaymentInstrumentApi,
# * Delete an PaymentInstrument
# * Include the profile_id and payment Id in the DELETE request to delete a Payment instrument.

public
class RemovePaymentIdentifier
  def main
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PaymentInstrumentApi.new(api_client)

    # Calling RetrievePaymentInstrument sample code
    response = PaymentInstrumentIdentifier.new.main

    data, status_code, headers = api_instance.paymentinstruments_token_id_delete(profile_id, response.id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  RemovePaymentIdentifier.new.main
end
