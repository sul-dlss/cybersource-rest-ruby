require 'cyberSource_client'

# * This is a sample code to call CreditApi,
# * Create an Credit
# * CreateCredit method will create a new Credit.

public
class CreateCredit
  def main
    request = CyberSource::CreateCreditRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::CreditApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_credit"
    request.client_reference_information = clientReferenceInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "Deo"
    billtoInformation.address1 = "1 Market St"
    billtoInformation.postal_code = "94105"
    billtoInformation.locality = "san francisco"
    billtoInformation.administrative_area = "CA"
    billtoInformation.first_name = "John"
    billtoInformation.phone_number = "4158880000"
    billtoInformation.email = "test@cybs.com"
    orderInformation.bill_to = billtoInformation
    request.order_information = orderInformation

    amountInformation = CyberSource::V2paymentsOrderInformationAmountDetails.new
    amountInformation.total_amount = "102.21"
    amountInformation.currency = "USD"
    orderInformation.amount_details = amountInformation
    request.order_information = orderInformation

    paymentInformation = CyberSource::V2paymentsPaymentInformation.new
    cardInformation =CyberSource::V2paymentsPaymentInformationCard.new
    cardInformation.expiration_year = "2031"
    cardInformation.number = "5555555555554444"
    cardInformation.expiration_month = "12"
    cardInformation.type = "002"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation
    data, status_code, headers = apiInstance.create_credit(request)
    puts data, status_code, headers
    data
  rescue StandardError => err
    puts err.message
  end
  CreateCredit.new.main
end
