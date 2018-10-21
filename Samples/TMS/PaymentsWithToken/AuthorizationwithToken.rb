require 'cyberSource_client'

class AuthorizationWithToken
    def main()
        request = CyberSource::CreatePaymentRequest.new
        apiClient = CyberSource::ApiClient.new
        apiInstance = CyberSource::PaymentApi.new(apiClient)

        clientReferenceInformation = CyberSource::V2paymentsClientReferenceInformation.new
        clientReferenceInformation.code = "TC50171_3"
        request.client_reference_information = clientReferenceInformation

        processingInformation = CyberSource::V2paymentsProcessingInformation.new
        processingInformation.commerce_indicator = "internet"
        request.processing_information = processingInformation

        subMerchant = CyberSource::V2paymentsAggregatorInformationSubMerchant.new
        subMerchant.card_acceptor_id = "1234567890"
        subMerchant.country = "US"
        subMerchant.phone_number = "650-432-0000"
        subMerchant.address1 = "900 Metro Center"
        subMerchant.postal_code = "94404-2775"
        subMerchant.locality = "Foster City"
        subMerchant.name = "Visa Inc"
        subMerchant.administrative_area = "CA"
        subMerchant.region = "PEN"
        subMerchant.email = "test@cybs.com"

        aggregatorInformation = CyberSource::V2paymentsAggregatorInformation.new
        aggregatorInformation.sub_merchant = subMerchant
        aggregatorInformation.name = "V-Internatio"
        aggregatorInformation.aggregator_id = "123456789"
        request.aggregator_information = aggregatorInformation

        billTo = CyberSource::V2paymentsOrderInformationBillTo.new
        billTo.country = "US"
        billTo.last_name = "Deo"
        billTo.address2 =  "Address 2"
        billTo.address1 = "201 S. Division St."
        billTo.postal_code = "48104-2201"
        billTo.locality = "Ann Arbor"
        billTo.administrative_area = "MI"
        billTo.first_name = "John"
        billTo.phone_number = "999999999"
        billTo.district = "MI"
        billTo.building_number = "123"
        billTo.company = "Visa"
        billTo.email = "test@cybs.com"
    
        amountDetails = CyberSource::V2paymentsOrderInformationAmountDetails.new
        amountDetails.total_amount = "22"
        amountDetails.currency = "USD"

        orderInformation = CyberSource::V2paymentsOrderInformation.new
        orderInformation.bill_to = billTo
        orderInformation.amount_details = amountDetails
        request.order_information = orderInformation

        paymentInformation = CyberSource::V2paymentsPaymentInformation.new
        customer = CyberSource::V2paymentsPaymentInformationCustomer.new
        # Validation issue in model class , expecting customer_id length <=26
        customer.customer_id = "7500BB199B4270EFE05340588D0AFCAD"
        paymentInformation.customer = customer
        request.payment_information = paymentInformation
        data, status_code, headers = apiInstance.create_payment(request)
        puts data, status_code, headers
    rescue StandardError => err
        puts err.message
    end
    AuthorizationWithToken.new.main
end

    
    
    
    

   