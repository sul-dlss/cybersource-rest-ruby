require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class CreateReportSubscriptionForReportNameByOrganization
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    request= CyberSource::RequestBody1.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportSubscriptionsApi.new(api_client, config)
    request.report_definition_name="TransactionRequestClass"
    request.report_fields=[
            "Request.RequestID",
            "Request.TransactionDate",
            "Request.MerchantID"
    ]
    request.report_mime_type="text/csv"
    request.report_name = "2019test"
    request.report_frequency="MONTHLY"
    request.timezone="America/Chicago"
    request.start_time="0406"
    request.start_day=1
    data, status_code, headers = api_instance.create_subscription(request)
    puts data, status_code, headers
    if(status_code == 201)
      require_relative './DeleteSubscriptionOfReportNameByOrganization.rb'
      data, status_code, headers = api_instance.delete_subscription(request.report_name)
      puts data, status_code, headers 
    end
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    CreateReportSubscriptionForReportNameByOrganization.new.main
  end
end
