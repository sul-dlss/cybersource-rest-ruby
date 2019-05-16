require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class CreateAdhocReport
  def main()
   config = MerchantConfiguration.new.merchantConfigProp()
   request= CyberSource::RequestBody.new
   api_client = CyberSource::ApiClient.new
   api_instance = CyberSource::ReportsApi.new(api_client, config)
   request.report_definition_name = "TransactionRequestClass"
   request.report_fields=[
    "Request.RequestID",
    "Request.TransactionDate",
    "Request.MerchantID"
   ]
   request.report_mime_type="application/xml"
   request.timezone = "GMT"
   request.report_name = "adhoc_report_2020"
   request.report_start_time = "2019-01-02T12:00:00+05:00"
   request.report_end_time = "2019-01-03T12:00:00+05:00"
   report_pref = {}
   report_pref['SignedAmounts'] = "true"
   report_pref['fieldNameConvention'] = "SOAPI"
   request.report_preferences = report_pref
   
   data, status_code, headers = api_instance.create_report(request)
   puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
CreateAdhocReport.new.main
end