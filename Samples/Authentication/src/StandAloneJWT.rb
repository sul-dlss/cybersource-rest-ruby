

public 
class StandAloneJWT
  @@request_host = "apitest.cybersource.com"
  @@merchant_id = "testrest"
  @@merchant_key_id = "08c94330-f618-42a3-b09d-e1e43be5efda"
  @@merchant_secret_key = "yBJxy6LjM2TmcPGu+GaJrHtkke25fPpUX+UY6/L/1tE="
  @@payload = "{\n" +
        "  \"clientReferenceInformation\": {\n" +
        "    \"code\": \"TC50171_3\"\n" +
        "  },\n" +
        "  \"processingInformation\": {\n" +
        "    \"commerceIndicator\": \"internet\"\n" +
        "  },\n" +
        "  \"orderInformation\": {\n" +
        "    \"billTo\": {\n" +
        "      \"firstName\": \"john\",\n" +
        "      \"lastName\": \"doe\",\n" +
        "      \"address1\": \"201 S. Division St.\",\n" +
        "      \"postalCode\": \"48104-2201\",\n" +
        "      \"locality\": \"Ann Arbor\",\n" +
        "      \"administrativeArea\": \"MI\",\n" +
        "      \"country\": \"US\",\n" +
        "      \"phoneNumber\": \"999999999\",\n" +
        "      \"email\": \"test@cybs.com\"\n" +
        "    },\n" +
        "    \"amountDetails\": {\n" +
        "      \"totalAmount\": \"10\",\n" +
        "      \"currency\": \"USD\"\n" +
        "    }\n" +
        "  },\n" +
        "  \"paymentInformation\": {\n" +
        "    \"card\": {\n" +
        "      \"expirationYear\": \"2031\",\n" +
        "      \"number\": \"5555555555554444\",\n" +
        "      \"securityCode\": \"123\",\n" +
        "      \"expirationMonth\": \"12\",\n" +
        "      \"type\": \"002\"\n" +
        "    }\n" +
        "  }\n" +
        "}"
  
  def processPost()
  
  end
  
  def processGet()
  
  end
  
  def main
    # HTTP POST REQUEST
    puts "\n\nSample 1: POST call - CyberSource Payments API - HTTP POST Payment request"
    # statusCode = processPost()
	@statusCode = 0
	
    if @statusCode == 0
        puts "STATUS : SUCCESS (HTTP Status = #@statusCode)"
    else
        puts "STATUS : ERROR (HTTP Status = #@statusCode)"
	end
        
    # HTTP GET REQUEST
    puts "\n\nSample 2: GET call - CyberSource Reporting API - HTTP GET Reporting request"
    # statusCode = processGet()
    
    if @statusCode == 0
        puts "STATUS : SUCCESS (HTTP Status = #@statusCode)"
    else
        puts "STATUS : ERROR (HTTP Status = #@statusCode)"
	end
	
	puts "Request Host : #@@request_host\n"
	puts "Merchant ID : #@@merchant_id\n"
	puts "Merchant Key ID : #@@merchant_key_id\n"
	puts "Merchant Secret Key ID : #@@merchant_secret_key\n"
	puts "Payload :\n #@@payload\n"
	
  end
  
  if __FILE__ == $0
    StandAloneJWT.new.main
  end
end