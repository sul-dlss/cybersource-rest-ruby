require 'cyberSource_client'

public
class PaymentInstrumentsForAuthorization
  def main
        body = CyberSource::Body2.new
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::PaymentInstrumentApi.new(api_client)
        profile_id = "93B32398-AD51-4CC2-A682-EA3E93614EB1"
        
        card = CyberSource::PaymentinstrumentsCard.new
        card.expiration_month = "09"
        card.expiration_year = "2022"
        card.type = "visa"
        body.card = card

        bill_to = CyberSource::PaymentinstrumentsBillTo.new
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
        
        instrument_identifier_card = CyberSource::InstrumentidentifiersCard.new
        instrument_identifier_card.number = "4111111111111111"

        instrument_identifier = CyberSource::PaymentinstrumentsInstrumentIdentifier.new
        instrument_identifier.card = instrument_identifier_card
        body.instrument_identifier = instrument_identifier

        data, status_code, headers = api_instance.paymentinstruments_post(profile_id, body)
        puts data, status_code, headers
    rescue StandardError => err
        puts err.message
    end
    PaymentInstrumentsForAuthorization.new.main
end