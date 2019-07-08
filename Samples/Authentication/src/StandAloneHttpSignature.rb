require 'digest'
require 'openssl'
require 'date'
require 'typhoeus'
require 'uri'
require 'base64'

public 
class StandAloneHttpSignature
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
		
  def getHttpSignature(resource, http_method, gmtdatetime)
	signatureHeaderValue = ''
    signatureHeaderValue << "keyid=\"" + @@merchant_key_id + "\""
	signatureHeaderValue << ', ' + "algorithm=\"HmacSHA256\""
	signatureHeader = 'host date (request-target) digest v-c-merchant-id'
	signatureHeaderValue << ', ' + "headers=\"" + signatureheader + "\""
	
	signatureString = 'host: ' + @@request_host
	signatureString << "\ndate: " + gmtdatetime
	signatureString << "\n(request-target): "
	
	targetUrl = http_method = ' ' + resource
	
	signatureString << targetUrl + "\n"
	
	if http_method == "post"
		payload = @@payload
		digest = Digest::SHA256.base64digest(payload)
		digest_payload = 'SHA-256=' + digest
		signatureString << 'digest: ' + digest_payload + "\n"
	end
	
	signatureString << 'v-c-merchant-id: ' + @@merchant_id
	encodedSignatureString = signatureString.force_encoding(Encoding::UTF_8)
	decodedKey = Base64.decode64(@@merchant_secret_key)
	base64EncodedSignature = Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', decodedKey, encodedSignatureString))
	
	signature_value = base64EncodedSignature
	
	signatureHeaderValue << ", signature=\"" + signature_value + "\""
	
	return signatureHeaderValue
  end
  
  def processPost()
	resource = "/pts/v2/payments/"
    method = "post"
    statusCode = -1
    url = "https://" + @@request_host + resource
	
	header_params = {}
	header_params['Accept'] = 'application/hal+json;charset=utf-8'
	header_params['Content-Type'] = 'application/json;charset=utf-8'
	
	auth_names = []
	gmtDateTime = DateTime.now.httpdate
	
	token = getHttpSignature(resource, method, gmtDateTime)
	
	header_params['v-c-merchant-id'] = @@merchant_id
	header_params['Date'] = gmtDateTime
	header_params['Host'] = @@request_host
	header_params['Signature'] = token
	
	payload = @@payload
	digest = Digest::SHA256.base64digest(payload)
	digest_payload = 'SHA-256=' + digest
	header_params['Digest'] = digest_payload
	
	_verify_ssl_host = 0
	
	puts "\n -- RequestURL -- \n"
    puts "\tURL : " + url + "\n"
    puts "\n -- HTTP Headers -- \n"
    puts "\tContent-Type : application/json;charset=utf-8" + "\n"
    puts "\tv-c-merchant-id : " + @@merchant_id + "\n"
    puts "\tDate : " + gmtDateTime + "\n"
    puts "\tHost : " + @@request_host + "\n"
	
	req_opts = {
		:method => method,
		:headers => header_params,
		:timeout => 0,
		:ssl_verifypeer => false,
		:ssl_verifyhost => _verify_ssl_host,
		:sslcert => nil,
		:sslkey => nil,
		:verbose => false,
		:body => @@payload
	}
	
	request = Typhoeus::Request.new(url, req_opts)
	response = request.run
	
	if response.code >= 200 && response.code <= 299
        statusCode = 0
	end
    
    puts "\n -- Response Message -- \n"
    puts "\tResponse Code : " + response.code.to_s + "\n"
    # puts "\tv-c-correlation-id : " + response.headers["v-c-merchant-id"] + "\n"
	p response.headers
	puts "\n"
    puts "\tResponse Data :\n"
	puts response.body + "\n"
    
    return statusCode;
  end
  
  def processGet()
	resource = "/reporting/v3/reports?startTime=2018-10-01T00:00:00.0Z&endTime=2018-10-30T23:59:59.0Z&timeQueryType=executedTime&reportMimeType=application/xml"
    method = "get"
    statusCode = -1
    url = "https://" + @@request_host + resource
	
	header_params = {}
	header_params['Accept'] = 'application/hal+json;charset=utf-8'
	header_params['Content-Type'] = 'application/json;charset=utf-8'
	
	auth_names = []
	gmtDateTime = DateTime.now.httpdate
	
	token = getHttpSignature(resource, method, gmtDateTime)
	
	header_params['v-c-merchant-id'] = @@merchant_id
	header_params['Date'] = gmtDateTime
	header_params['Host'] = @@request_host
	header_params['Signature'] = token
	
	_verify_ssl_host = 0
	
	puts "\n -- RequestURL -- \n"
    puts "\tURL : " + url + "\n"
    puts "\n -- HTTP Headers -- \n"
    puts "\tContent-Type : application/json;charset=utf-8" + "\n"
    puts "\tv-c-merchant-id : " + @@merchant_id + "\n"
    puts "\tDate : " + gmtDateTime + "\n"
    puts "\tHost : " + @@request_host + "\n"
	
	req_opts = {
		:method => method,
		:headers => header_params,
		:timeout => 0,
		:ssl_verifypeer => false,
		:ssl_verifyhost => _verify_ssl_host,
		:sslcert => nil,
		:sslkey => nil,
		:verbose => false,
		:body => @@payload
	}
	
	request = Typhoeus::Request.new(url, req_opts)
	response = request.run
	
	if response.code >= 200 && response.code <= 299
        statusCode = 0
	end
    
    puts "\n -- Response Message -- \n"
    puts "\tResponse Code : " + response.code.to_s + "\n"
    # puts "\tv-c-correlation-id : " + response.headers["v-c-merchant-id"] + "\n"
	p response.headers
	puts "\n"
    puts "\tResponse Data :\n"
	puts response.body + "\n"
    
    return statusCode;
  end
  
  def main
    # HTTP POST REQUEST
    puts "\n\nSample 1: POST call - CyberSource Payments API - HTTP POST Payment request"
    @statusCode = processPost()
	
    if @statusCode == 0
        puts "STATUS : SUCCESS (HTTP Status = #@statusCode)"
    else
        puts "STATUS : ERROR (HTTP Status = #@statusCode)"
	end
        
    # HTTP GET REQUEST
    puts "\n\nSample 2: GET call - CyberSource Reporting API - HTTP GET Reporting request"
    @statusCode = processGet()
    
    if @statusCode == 0
        puts "STATUS : SUCCESS (HTTP Status = #@statusCode)"
    else
        puts "STATUS : ERROR (HTTP Status = #@statusCode)"
	end
	
  end
  
  if __FILE__ == $0
    StandAloneHttpSignature.new.main
  end
end