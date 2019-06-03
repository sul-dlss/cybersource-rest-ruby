require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call ValidateAuthenticationResults

public
class ValidateAuthenticationResults
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PayerAuthenticationApi.new(api_client, config)

    # Calling ValidateAuthenticationResults Sample code
    client_reference_information = CyberSource::Riskv1authenticationsClientReferenceInformation.new
    client_reference_information.code = "pavalidatecheck"

    card_information = CyberSource::Riskv1authenticationresultsPaymentInformationCard.new
    card_information.number = "5200000000000007"
    card_information.expiration_month = "12"
    card_information.expiration_year = "2025"
    card_information.type = "002"

    payment_information = CyberSource::Riskv1authenticationresultsPaymentInformation.new
    payment_information.card = card_information

    amount_details = CyberSource::Riskv1decisionsOrderInformationAmountDetails.new
    amount_details.currency = "USD"
    amount_details.total_amount = "200.00"

    line_items = CyberSource::Riskv1authenticationresultsOrderInformationLineItems.new
    line_items.unit_price = "10"
    line_items.quantity = 2
    line_items.tax_amount = "32.40"

    order_information = CyberSource::Riskv1authenticationresultsOrderInformation.new
    order_information.amount_details = amount_details
    order_information.line_items = line_items

    consumer_authentication_information = CyberSource::Riskv1authenticationresultsConsumerAuthenticationInformation.new
    consumer_authentication_information.authentication_transaction_id = 'PYffv9G3sa1e0CQr5fV0'
    consumer_authentication_information.signed_pares = 'eNqdmFmT4jgSgN+J4D90zD4yMz45PEFVhHzgA2zwjXnzhQ984Nvw61dAV1'

    request = CyberSource::Request.new
    request.order_information = order_information
    request.payment_information = payment_information
    request.client_reference_information = client_reference_information
    request.consumer_authentication_information = consumer_authentication_information
    
    data, status_code, headers = api_instance.risk_v1_authentication_results_post(request)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    ValidateAuthenticationResults.new.main
  end
end
