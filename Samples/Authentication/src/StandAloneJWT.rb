require 'base64'
require 'openssl'
require 'jwt'
require 'json'
require 'date'
require 'typhoeus'
require 'uri'

public 
class StandAloneJWT
  @@request_host = "apitest.cybersource.com"
  @@merchant_id = "testrest"
  @@merchant_key_id = "08c94330-f618-42a3-b09d-e1e43be5efda"
  @@merchant_secret_key = "yBJxy6LjM2TmcPGu+GaJrHtkke25fPpUX+UY6/L/1tE="
  @@filename = "testrest"
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
		
  def getJsonWebToken(resource, http_method, gmtdatetime)
	jwtBody = ''
	filePath = File.join(File.dirname(__FILE__), "../resource/" + @@filename + ".p12")
	
	puts "FilePath : " + filePath
	
	p12File = File.binread(filePath)
	
	if http_method == "post"
		payload = @@payload
		digest = Digest::SHA256.base64digest(payload)
		jwtBody = "{\n      \"digest\":\"" + digest + "\", \"digestAlgorithm\":\"SHA-256\", \"iat\":\"" + gmtdatetime + "\"}"
	elsif http_method == "get"
		jwtBody = "{\n \"iat\":\"" + gmtdatetime + "\"\n} \n\n"
	end
	
	claimSet = JSON.parse(jwtBody)
	p12FilePath = OpenSSL::PKCS12.new(p12File, "testrest")
	
	publicKey = OpenSSL::PKey::RSA.new(p12FilePath.key.public_key)
	privateKey = OpenSSL::PKey::RSA.new(p12FilePath.key)
	cert = OpenSSL::X509::Certificate.new(p12FilePath.certificate.to_pem)
	
	x5clist = [cert]
	
	customHeaders = {}
	customHeaders['v-c-merchant-id'] = merchantconfig_obj.keyAlias
	customHeaders['x5c'] = x5clist
	
	token = JWT.encode(claimSet, privateKey, 'RS256', customHeaders)
    
	return token
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
	
	token = getJsonWebToken(resource, method, gmtDateTime)
	
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
    puts "\tResponse Code : " + response.code + "\n"
    puts "\tv-c-correlation-id : " + response.headers["v-c-merchant-id"] + "\n"
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
	
	token = getJsonWebToken(resource, method, gmtDateTime)
	
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
    puts "\tResponse Code : " + response.code + "\n"
    puts "\tv-c-correlation-id : " + response.headers["v-c-merchant-id"] + "\n"
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
    StandAloneJWT.new.main
  end
end