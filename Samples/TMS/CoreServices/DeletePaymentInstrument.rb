require 'cyberSource_client'

# * This is a sample code to call PaymentInstrumentApi,
# * Delete an PaymentInstrument
# * Include the profileId and payment Id in the DELETE request to delete a Payment instrument.

public
class RemovePaymentIdentifier
  def main
    id = '78436D44E0AC2BD4E05341588E0A6305'
    profileId = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentInstrumentApi.new(apiClient)
    data, status_code, headers = apiInstance.paymentinstruments_token_id_delete(profileId, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  RemovePaymentIdentifier.new.main
end
