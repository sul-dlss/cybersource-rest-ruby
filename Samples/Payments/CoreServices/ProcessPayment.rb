require 'cyberSource_client'

# * This is a sample code to call PaymentApi,
# * for Core Services - Process Payment
# * createPayment method will create a new payment

public
class CreatePayment
  def main(capture_flag)
    request = CyberSource::CreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentApi.new(apiClient)

    clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
    clientReferenceInformation.code = "test_payment"
    request.client_reference_information = clientReferenceInformation
    
    processingInformation = CyberSource::V2paymentsProcessingInformation.new
    processingInformation.commerce_indicator = "internet"
    if capture_flag
      processingInformation.capture = true
    end
    request.processing_information = processingInformation
   
    aggregatorInformation = CyberSource::V2paymentsAggregatorInformation.new
    submerchantinformation = CyberSource::V2paymentsAggregatorInformationSubMerchant.new
    submerchantinformation.card_acceptor_id = "1234567890"
    submerchantinformation.country = "US"
    submerchantinformation.phone_number = "4158880000"
    submerchantinformation.address1 = "1 Market St"
    submerchantinformation.postal_code = "94105"
    submerchantinformation.locality = "san francisco"
    submerchantinformation.name = "Visa Inc"
    submerchantinformation.administrative_area = "CA"
    submerchantinformation.region = "PEN"
    submerchantinformation.email = "test@cybs.com"
    aggregatorInformation.sub_merchant = submerchantinformation
    aggregatorInformation.name = "V-Internatio"
    aggregatorInformation.aggregator_id = "123456789"
    request.aggregator_information = aggregatorInformation
    
    orderInformation = CyberSource::V2paymentsOrderInformation.new
    billtoInformation = CyberSource::V2paymentsOrderInformationBillTo.new
    billtoInformation.country = "US"
    billtoInformation.last_name = "Deo"
    billtoInformation.address2 = "Address 2"
    billtoInformation.address1 = "1 Market St"
    billtoInformation.postal_code = "94105"
    billtoInformation.locality = "san francisco"
    billtoInformation.administrative_area = "CA"
    billtoInformation.first_name = "John"
    billtoInformation.phone_number = "4158880000"
    billtoInformation.district = "MI"
    billtoInformation.building_number = "123"
    billtoInformation.company = "Visa"
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
    cardInformation.security_code = "123"
    cardInformation.expiration_month = "12"
    cardInformation.type = "002"
    paymentInformation.card = cardInformation
    request.payment_information = paymentInformation
    data, status_code, headers = apiInstance.create_payment(request)
    puts data, status_code, headers
    data
  rescue StandardError => err
    puts err.message
  end
  CreatePayment.new.main(false)
end
