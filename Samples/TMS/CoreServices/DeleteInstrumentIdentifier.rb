require 'cyberSource_client'

# * This is a sample code to call InstrumentIdentifierApi,
# * Delete an Instrument Identifier
# * Include the profileId and instrument Id in the DELETE request to delete a instrument identifier.

public
class RemoveInstrumentIdentifier
  def main
    id = '7020000000000137654'
    profileId = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::InstrumentIdentifierApi.new(apiClient)
    data, status_code, headers = apiInstance.instrumentidentifiers_token_id_delete(profileId, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  RemoveInstrumentIdentifier.new.main
end
