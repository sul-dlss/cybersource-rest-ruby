require 'cybersource_rest_client'
require_relative './RetrieveInstrumentIdentifier.rb'
require_relative '../../../Data/Configuration.rb'

# * This is a sample code to call InstrumentIdentifierApi,
# * Delete an Instrument Identifier
# * Include the profile_id and instrument Id in the DELETE request to delete a instrument identifier.

public
class RemoveInstrumentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client,config)

    # Calling RetrieveInstrumentIdentifier sample code
    response = RetrieveInstrumentIdentifier.new.main
    resp = JSON.parse(response)
    id = resp['id']

    data, status_code, headers = api_instance.tms_v1_instrumentidentifiers_token_id_delete(profile_id, id)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  if __FILE__ == $0
    RemoveInstrumentIdentifier.new.main
  end
end
