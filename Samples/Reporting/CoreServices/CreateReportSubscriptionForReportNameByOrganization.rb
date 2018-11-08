require 'cybersource_rest_client'
require_relative '../../../Data/Configuration.rb'

public
class CreateReportSubscriptionForReportNameByOrganization
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    request= CyberSource::RequestBody.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportSubscriptionsApi.new(api_client, config)
    request.report_definition_name="TransactionRequestClass"
    request.report_fields=[
            "Request.RequestID",
            "Request.TransactionDate",
            "Request.MerchantID"
    ]
    request.report_mime_type="application/xml"
    request.report_name = "TRR1_182"
    request.report_frequency="WEEKLY"
    request.timezone="America/Chicago"
    request.start_time="0900"
    request.start_day=1
    data, status_code, headers = api_instance.create_subscription(request)
    puts data, status_code, headers

  rescue StandardError => err
    puts err.message
  end
CreateReportSubscriptionForReportNameByOrganization.new.main
end
