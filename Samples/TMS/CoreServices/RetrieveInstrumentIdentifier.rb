require 'cybersource_rest_client'
require_relative './CreateInstrumentIdentifier.rb'
require_relative '../../../Data/Configuration.rb'

# * This is a sample code to call InstrumentIdentifierApi,
# * Retrieve an Instrument Identifier
# * Include the profile_id and instrument Id in the GET request to retrieve instrument identifier.

public
class RetrieveInstrumentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    profile_id = '93B32398-AD51-4CC2-A682-EA3E93614EB1'
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client, config)

    # Calling CreateInstrumentIdentifier sample code
    response = CreateInstrumentIdentifier.new.main
    resp = JSON.parse(response)
    id = resp['id']

    data, status_code, headers = api_instance.tms_v1_instrumentidentifiers_token_id_get(profile_id, id)
    puts data, status_code, headers
    data
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    RetrieveInstrumentIdentifier.new.main
  end
end
