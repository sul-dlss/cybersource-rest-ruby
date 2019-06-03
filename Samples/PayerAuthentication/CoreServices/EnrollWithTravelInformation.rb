require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call EnrollWithTravelInformation

public
class EnrollWithTravelInformation
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PayerAuthenticationApi.new(api_client, config)

    # Calling EnrollWithTravelInformation Sample code
    client_reference_information = CyberSource::Riskv1authenticationsClientReferenceInformation.new
    client_reference_information.code = "cybs_test"

    card_information = CyberSource::Riskv1authenticationsPaymentInformationCard.new
    card_information.number = "5200340000000015"
    card_information.expiration_month = "12"
    card_information.expiration_year = "2025"

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
	
	legs = []
	leg0 = CyberSource::Riskv1authenticationsTravelInformationLegs.new
	leg0.carrier_code = "UA"
	leg0.departure_date = "2019-01-01"
	leg0.origination = "LAX"
	leg0.destination = "DEF"

	leg1 = CyberSource::Riskv1authenticationsTravelInformationLegs.new
	leg1.carrier_code = "AS"
	leg1.departure_date = "2019-02-21"
	leg1.origination = "ECF"
	leg1.destination = "RES"
	
	legs << leg0
	legs << leg1
	travel_information.legs = legs
	travel_information.number_of_passengers = "2"

	passengers = []
	passenger0 = CyberSource::Riskv1authenticationsTravelInformationPassengers.new
	passenger0.first_name = "Raj"
	passenger0.last_name = "Charles"

	passenger1 = CyberSource::Riskv1authenticationsTravelInformationPassengers.new
	passenger1.first_name = "Potter"
	passenger1.last_name = "Suhember"

	passengers << passenger0
	passengers << passenger1
	travel_information.passengers = passengers

    buyer_information = CyberSource::Riskv1authenticationsBuyerInformation.new
    buyer_information.mobile_phone = "1245789632"

    consumer_authentication_information = CyberSource::Riskv1authenticationsConsumerAuthenticationInformation.new
    consumer_authentication_information.transaction_mode = 'MOTO'
	
	request = CyberSource::CheckPayerAuthEnrollmentRequest.new
    request.order_information = order_information
    request.payment_information = payment_information
    request.client_reference_information = client_reference_information
    request.buyer_information = buyer_information
    request.consumer_authentication_information = consumer_authentication_information
	request.travel_information = travel_information
    
    data, status_code, headers = api_instance.check_payer_auth_enrollment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    EnrollWithTravelInformation.new.main
  end
end
