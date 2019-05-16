require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'


public
class GetPurchaseAndRefundDetails
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    start_time = "2019-04-01T12:00:00-05:00"
    end_time = "2019-04-30T12:00:00-05:00"
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PurchaseAndRefundDetailsApi.new(api_client, config)
    opts = {}
    opts[:'organizationId'] = "testrest"
    opts[:'paymentSubtype'] =  "VI"
    opts[:'viewBy'] =  "requestDate"
    opts[:'groupName'] = "groupName"
    opts[:'offset'] = 20
    opts[:'limit'] = 200
    data, status_code, headers = api_instance.get_purchase_and_refund_details(start_time, end_time, opts)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  GetPurchaseAndRefundDetails.new.main
end


