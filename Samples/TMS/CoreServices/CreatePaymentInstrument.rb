require 'cyberSource_client'

# * This is a sample code to call PaymentInstrumentApi,
# * Process an Payment Instrument
# * Include the profileId in the POST request to create a new payment instrument.

public
class CreatePaymentIdentifier
  def main
        profileId = '93B32398-AD51-4CC2-A682-EA3E93614EB1'

        body = CyberSource::Body2.new
        apiClient = CyberSource::ApiClient.new
        apiInstance = CyberSource::PaymentInstrumentApi.new(apiClient)

        card = CyberSource::PaymentinstrumentsCard.new
        card.expiration_month = "09"
        card.expiration_year = "2022"
        card.type = "visa"
        body.card = card

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
        body.bill_to = billTo
        
        instrumentIdentifierCard = CyberSource::InstrumentidentifiersCard.new
        instrumentIdentifierCard.number = "4111111111111111"

        instrumentIdentifier = CyberSource::PaymentinstrumentsInstrumentIdentifier.new
        instrumentIdentifier.card = instrumentIdentifierCard
        body.instrument_identifier = instrumentIdentifier

        data, status_code, headers = apiInstance.paymentinstruments_post(profileId, body)
        puts data, status_code, headers
    rescue StandardError => err
      puts err.message
    end
    CreatePaymentIdentifier.new.main
end