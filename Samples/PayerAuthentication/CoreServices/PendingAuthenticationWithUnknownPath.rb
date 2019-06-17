require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call PendingAuthenticationWithUnknownPath

public
class PendingAuthenticationWithUnknownPath
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PayerAuthenticationApi.new(api_client, config)

    # Calling PendingAuthenticationWithUnknownPath Sample code
    client_reference_information = CyberSource::Riskv1authenticationsClientReferenceInformation.new
    client_reference_information.code = "UNKNOWN"

    card_information = CyberSource::Riskv1authenticationsPaymentInformationCard.new
    card_information.number = "4012001037490014"
    card_information.expiration_month = "12"
    card_information.expiration_year = "2025"
    card_information.type = "001"

    payment_information = CyberSource::Riskv1authenticationsPaymentInformation.new
    payment_information.card = card_information

    amount_details = CyberSource::Riskv1decisionsOrderInformationAmountDetails.new
    amount_details.currency = "USD"
    amount_details.total_amount = "10.99"

    bill_to = CyberSource::Riskv1authenticationsOrderInformationBillTo.new
    bill_to.address1 = "1 Market St"
    bill_to.address2 = "Address 2"
    bill_to.administrative_area = "CA"
    bill_to.country = "US"
    bill_to.locality = "san francisco"
    bill_to.first_name = "James"
    bill_to.last_name = "Doe"
    bill_to.phone_number = "4158880000"
    bill_to.email = "test@cybs.com"
    bill_to.postal_code = "94105"

    order_information = CyberSource::Riskv1authenticationsOrderInformation.new
    order_information.amount_details = amount_details
    order_information.bill_to = bill_to

    request = CyberSource::CheckPayerAuthEnrollmentRequest.new
    request.order_information = order_information
    request.payment_information = payment_information
    request.client_reference_information = client_reference_information
    
    data, status_code, headers = api_instance.check_payer_auth_enrollment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    PendingAuthenticationWithUnknownPath.new.main
  end
end
