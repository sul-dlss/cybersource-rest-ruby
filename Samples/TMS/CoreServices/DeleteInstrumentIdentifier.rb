require 'cyberSource_client'
require_relative './RetrieveInstrumentIdentifier.rb'

# * This is a sample code to call InstrumentIdentifierApi,
# * Delete an Instrument Identifier
# * Include the profile_id and instrument Id in the DELETE request to delete a instrument identifier.

public
class RemoveInstrumentIdentifier
  def main
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client)

    # Calling RetrieveInstrumentIdentifier sample code
    response = RetrieveInstrumentIdentifier.new.main

    data, status_code, headers = api_instance.instrumentidentifiers_token_id_delete(profile_id, response.id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  RemoveInstrumentIdentifier.new.main
end
