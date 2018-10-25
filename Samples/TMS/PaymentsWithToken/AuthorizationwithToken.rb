require 'cyberSource_client'

class AuthorizationWithToken
    def main()
        request = CyberSource::CreatePaymentRequest.new
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::PaymentApi.new(api_client)

        client_reference_information = CyberSource::V2paymentsClientReferenceInformation.new
        client_reference_information.code = "TC50171_3"
        request.client_reference_information = client_reference_information

        processing_information = CyberSource::V2paymentsProcessingInformation.new
        processing_information.commerce_indicator = "internet"
        request.processing_information = processing_information

        sub_merchant = CyberSource::V2paymentsAggregatorInformationSubMerchant.new
        sub_merchant.card_acceptor_id = "1234567890"
        sub_merchant.country = "US"
        sub_merchant.phone_number = "650-432-0000"
        sub_merchant.address1 = "900 Metro Center"
        sub_merchant.postal_code = "94404-2775"
        sub_merchant.locality = "Foster City"
        sub_merchant.name = "Visa Inc"
        sub_merchant.administrative_area = "CA"
        sub_merchant.region = "PEN"
        sub_merchant.email = "test@cybs.com"

        aggregator_information = CyberSource::V2paymentsAggregatorInformation.new
        aggregator_information.sub_merchant = sub_merchant
        aggregator_information.name = "V-Internatio"
        aggregator_information.aggregator_id = "123456789"
        request.aggregator_information = aggregator_information

        bill_to = CyberSource::V2paymentsOrderInformationBillTo.new
        bill_to.country = "US"
        bill_to.last_name = "Deo"
        bill_to.address2 =  "Address 2"
        bill_to.address1 = "201 S. Division St."
        bill_to.postal_code = "48104-2201"
        bill_to.locality = "Ann Arbor"
        bill_to.administrative_area = "MI"
        bill_to.first_name = "John"
        bill_to.phone_number = "999999999"
        bill_to.district = "MI"
        bill_to.building_number = "123"
        bill_to.company = "Visa"
        bill_to.email = "test@cybs.com"
    
        amount_details = CyberSource::V2paymentsOrderInformationAmountDetails.new
        amount_details.total_amount = "22"
        amount_details.currency = "USD"

        order_information = CyberSource::V2paymentsOrderInformation.new
        order_information.bill_to = bill_to
        order_information.amount_details = amount_details
        request.order_information = order_information

        payment_information = CyberSource::V2paymentsPaymentInformation.new
        customer = CyberSource::V2paymentsPaymentInformationCustomer.new
        # Validation issue in model class , expecting customer_id length <=26
        customer.customer_id = "7500BB199B4270EFE05340588D0AFCAD"
        payment_information.customer = customer
        request.payment_information = payment_information

        data, status_code, headers = api_instance.create_payment(request)
        puts data, status_code, headers
    rescue StandardError => err
        puts err.message
    end
    AuthorizationWithToken.new.main
end

    
    
    
    

   