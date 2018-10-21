require 'cyberSource_client'

# * This is a sample code to call Payout - DefaultApi,
# * Process a Payout
# * OctCreatePaymentRequest method will create a new payout

public
class ProcessAPayout
  def main
    request = CyberSource::OctCreatePaymentRequest.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::DefaultApi.new(apiClient)

    clientReferenceInformation = CyberSource::InlineResponse201ClientReferenceInformation.new
    clientReferenceInformation.code = "33557799"
    request.client_reference_information = clientReferenceInformation

    senderInformation = CyberSource::V2payoutsSenderInformation.new
    senderInformation.reference_number = "1234567890"
    senderInformation.address1 = "900 Metro Center Blvd.900"
    senderInformation.country_code = "US"
    senderInformation.locality = "Foster City"
    senderInformation.name = "Thomas Jefferson"
    senderInformation.administrative_area = "CA"
    account = CyberSource::V2payoutsSenderInformationAccount.new
    account.number = "1234567890123456789012345678901234"
    account.funds_source = "01"
    senderInformation.account = account
    request.sender_information = senderInformation

    processingInformation = CyberSource::V2payoutsProcessingInformation.new
    processingInformation.commerce_indicator = "internet"
    processingInformation.business_application_id = "FD"
    processingInformation.network_routing_order = "ECG"
    request.processing_information = processingInformation

    payoutOptions = CyberSource::V2payoutsProcessingInformationPayoutsOptions.new
    payoutOptions.retrieval_reference_number = "123456789012"
    payoutOptions.acquirer_bin = "567890124"

    # missing
    # processingInformation.reconciliation_id = "1087488702VIAQNSPQ"

    orderInformation = CyberSource::V2payoutsOrderInformation.new
    amountDetails = CyberSource::V2payoutsOrderInformationAmountDetails.new
    amountDetails.total_amount = "100.00"
    amountDetails.currency = "USD"
    orderInformation.amount_details = amountDetails
    request.order_information = orderInformation

    merchantInformation = CyberSource::V2payoutsMerchantInformation.new
    merchantInformation.category_code = 123
    merchantDescriptor = CyberSource::V2payoutsMerchantInformationMerchantDescriptor.new
    merchantDescriptor.country = "US"
    merchantDescriptor.postal_code = "94440"
    merchantDescriptor.locality = "FC"
    merchantDescriptor.name = "Thomas"
    merchantDescriptor.administrative_area = "CA"
    merchantInformation.merchant_descriptor = merchantDescriptor
    request.merchant_information = merchantInformation

    paymentInformation = CyberSource::V2payoutsPaymentInformation.new
    paymentInformationCard = CyberSource::V2payoutsPaymentInformationCard.new
    paymentInformationCard.expiration_year = "2025"
    paymentInformationCard.number = "4111111111111111"
    paymentInformationCard.expiration_month = "12"
    paymentInformationCard.type = "001"
    paymentInformationCard.source_account_type = "CH"
    paymentInformation.card = paymentInformationCard
    request.payment_information = paymentInformation

    recipientInformation = CyberSource::V2payoutsRecipientInformation.new
    recipientInformation.first_name = "John"
    recipientInformation.last_name = "Doe"
    recipientInformation.address1 = "Paseo Padre Boulevard"
    recipientInformation.locality = "Foster City"
    recipientInformation.administrative_area = "CA"
    recipientInformation.postal_code = "94400"
    recipientInformation.phone_number = "6504320556"
    recipientInformation.date_of_birth = "19801009"
    recipientInformation.country = "US"
    request.recipient_information = recipientInformation

    data, status_code, headers = apiInstance.oct_create_payment(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
    puts err.backtrace
  end
  ProcessAPayout.new.main
end