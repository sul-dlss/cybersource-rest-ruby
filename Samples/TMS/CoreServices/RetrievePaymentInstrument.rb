require 'cyberSource_client'

# * This is a sample code to call PaymentInstrumentApi,
# * Retrieve an Payment Instrument
# * Include the profileId and Payment Id in the GET request to retrieve payment instrument.

public
class PaymentInstrumentIdentifier
  def main
    id = '7501E647FA683692E05340588D0A131D'
    profileId = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentInstrumentApi.new(apiClient)
    data, status_code, headers = apiInstance.paymentinstruments_token_id_get(profileId, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  PaymentInstrumentIdentifier.new.main
end
