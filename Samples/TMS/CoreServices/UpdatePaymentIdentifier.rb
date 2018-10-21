require 'cyberSource_client'

# * This is a sample code to call InstrumentIdentifierApi,
# * Update an Payment Identifier
# * Include the profileId, tokenId in the POST request to create a payment identifier.

public
class UpdatePaymentIdentifier
  def main
    body = CyberSource::Body3.new
    apiClient = CyberSource::ApiClient.new
    apiInstance = CyberSource::PaymentInstrumentApi.new(apiClient)

    card = CyberSource::PaymentinstrumentsCard.new
    card.expiration_month = "09"
    card.expiration_year = "2022"
    card.type = "visa"
    request.card = card

    billTo = CyberSource::PaymentinstrumentsBillTo.new
    billTo.first_name = "John"
    billTo.last_name = "Deo"
    billTo.company = "CyberSource"
    billTo.address1 = "12 Main Street"
    billTo.address2 = "20 My Street"
    billTo.locality = "Foster City"
    billTo.administrative_area = "CA"
    billTo.postal_code = "90200"
    billTo.country = "US"
    billTo.email = "john.smith@example.com"
    billTo.phone_number = "555123456"
    request.bill_to = billTo

    instrumentIdentifierCard = CyberSource::InstrumentidentifiersCard.new
    instrumentIdentifierCard.number = "4111111111111111"
    instrumentIdentifier = CyberSource::Instrumentidentifiers.new
    instrumentIdentifier.card = instrumentIdentifierCard
    request.instrument_identifier = instrumentIdentifier
    tokenId = "7020000000000137654"
    profileId = "93B32398-AD51-4CC2-A682-EA3E93614EB1"

    data, status_code, headers = apiInstance.paymentinstruments_token_id_patch(profileId, tokenId)
    puts data, status_code, headers
  rescue StandardError => err
    puts err.message
  end
  UpdatePaymentIdentifier.new.main
end