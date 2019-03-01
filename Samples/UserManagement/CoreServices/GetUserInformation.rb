require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class UserManagementUsername
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::UserManagementApi.new(api_client, config)
    opts = {}
    opts[:'organization_id'] = "testrest"
    data, status_code, headers = api_instance.get_users(opts)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  UserManagementUsername.new.main
end
