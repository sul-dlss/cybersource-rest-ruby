require 'cybersource_rest_client'
require_relative './RetrievePaymentInstrument.rb'
require_relative '../../../Data/Configuration.rb'

# * This is a sample code to call InstrumentIdentifierApi,
# * Update an Payment Identifier
# * Include the profile_id, token_id in the POST body to create a payment identifier.

public
class UpdatePaymentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    profile_id = "93B32398-AD51-4CC2-A682-EA3E93614EB1"

    body = CyberSource::Body3.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PaymentInstrumentsApi.new(api_client, config)

    # Calling RetrievePaymentInstrument sample code
    response = PaymentInstrumentIdentifier.new.main
    resp = JSON.parse(response)
    id = resp['id']

    card = CyberSource::Tmsv1paymentinstrumentsCard.new
    card.expiration_month = "09"
    card.expiration_year = "2022"
    card.type = "visa"
    body.card = card

    bill_to = CyberSource::Tmsv1paymentinstrumentsBillTo.new
    bill_to.first_name = "John"
    bill_to.last_name = "Deo"
    bill_to.company = "CyberSource"
    bill_to.address1 = "12 Main Street"
    bill_to.address2 = "20 My Street"
    bill_to.locality = "Foster City"
    bill_to.administrative_area = "CA"
    bill_to.postal_code = "90200"
    bill_to.country = "US"
    bill_to.email = "john.smith@example.com"
    bill_to.phone_number = "555123456"
    body.bill_to = bill_to

    instrument_identifier_card = CyberSource::Tmsv1instrumentidentifiersCard.new
    instrument_identifier_card.number = "4111111111111111"
    instrument_identifier = CyberSource::Tmsv1paymentinstrumentsInstrumentIdentifier.new
    instrument_identifier.card = instrument_identifier_card
    body.instrument_identifier = instrument_identifier
    
    data, status_code, headers = api_instance.tms_v1_paymentinstruments_token_id_patch(profile_id, id, body)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  if __FILE__ == $0
    UpdatePaymentIdentifier.new.main
  end
end
