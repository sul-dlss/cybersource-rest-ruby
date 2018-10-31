# cybersource-rest-auth-ruby
This project provides multiple sample codes for REST APIs supported by CyberSource.

## Requirements
* Ruby 2.2.2 or higher
* RubyGem 1.3.7 or higher (to build the gem)
* [CyberSource Account](https://developer.cybersource.com/api/developer-guides/dita-gettingstarted/registration.html)
* [CyberSource API Keys](https://prod.developer.cybersource.com/api/developer-guides/dita-gettingstarted/registration/createCertSharedKey.html)

_Note: Support for building the SDK with gem has been made.
 All initial libraries were installed with gem, however._
 
 ## Dependencies
* json-2.1.0, 1.8.1             : simple implementation of json
* interface-1.0.4	            : simple implementation of interface
* Jwt-2.1.0                     : Generating Json Web Token
* rubocop-0.57.2				: Automatic Ruby code style checking tool
* activesupport-5.2.0           : A toolkit of support libraries
* rspec-3.7.0               	: Unit testing
* simplecov-0.16.1  			: Code coverage and to generate coverage report

## To run rest client SDK

The rest client SDK works for POST, GET, PUT and DELETE requests.
It works with any one of the two authentication mechanisms, which are HTTP signature and JWT token.

#### To set your API credentials for an API request,Configure the following information in cybs.yml file:
  
  * Http

```
   authenticationType  = http_Signature
   merchantID 	       = <merchantID>
   runEnvironment      = "CyberSource.Environment.SANDBOX"
   merchantKeyId       = <merchantKeyId>
   merchantsecretKey   = <merchantsecretKey>
   enableLog           = true
   logDirectory        = <logDirectory>
   logMaximumSize      = <size>
   logFilename         = <logFilename>
```
  * Jwt

```
   authenticationType  = Jwt
   merchantID 	       = <merchantID>
   runEnvironment      = CyberSource.Environment.SANDBOX
   keyAlias		       = <keyAlias>
   keyPassword	       = <keyPass>
   keyFileName         = <keyFileName>
   keysDirectory       = <keysDirectory>
   enableLog           = true
   logDirectory        = <logDirectory>
   logMaximumSize      = <size>
   logFilename         = <logFilename>
```

### Switching between the sandbox environment and the production environment
CyberSource maintains a complete sandbox environment for testing and development purposes. This sandbox environment is an exact 
duplicate of our production environment with the transaction authorization and settlement process simulated. By default, this SDK is 
configured to communicate with the sandbox environment. To switch to the production environment, set the appropriate environment 
constant in cybs.yml file.  For example:

```Ruby
// For PRODUCTION use
  runEnvironment      = "CyberSource.Environment.PRODUCTION"
```
### Configure the following information in cybs.yml file
*	Authentication Type:  Merchant should enter “HTTP_Signature” for HTTP authentication mechanism or “JWT” for JWT authentication mechanism.
*	Merchant ID: Merchant will provide the merchant ID, which has taken from EBC portal.
*	MerchantSecretKey: Merchant will provide the secret Key value, which has taken from EBC portal.
*	MerchantKeyId:  Merchant will provide the Key ID value, which has taken from EBC portal.
*	keyAlias: Alias of the Merchant ID, to be used while generating the JWT token.
*	keyPassword: Alias of the Merchant password, to be used while generating the JWT token.
*	keyfilepath: Path of the folder where the .P12 file is placed. This file has generated from the EBC portal.
*	Enable Log: To start the log entry provide true else enter false.
*	LogDirectory: If log is enabled and valid log directory is provided, log files will get created here. Otherwise log files will be created in default location inside project base directory.

## SDK Usage Examples and Sample Code
 * To get started using this SDK, it's highly recommended to download our sample code repository.
 * In that respository, we have comprehensive sample code for all common uses of our API.
 * Additionally, you can find details and examples of how our API is structured in our API Reference Guide.

The [API Reference Guide](http://developer.cybersource.com/api/reference) provides examples of what information is needed for a particular request and how that information would be formatted. Using those examples, you can easily determine what methods would be necessary to include that information in a request using this SDK.

# Ruby Sample Code for the CyberSource SDK

This repository contains working code samples which demonstrate Ruby integration with the cybersource-rest-client-ruby and cybersource-rest-auth-ruby

The samples are organized into categories and common usage examples.

## Using the Sample Code

The samples are all completely independent and self-contained. You can analyze them to get an understanding of how a particular method works, or you can use the snippets as a starting point for your own project.

You can also run each sample directly from the command line.

## Running the Samples From the Command Line
* Clone this repository:
```
    $ git clone https://github.com/CyberSource/cybersource-rest-samples-ruby
```
* Install the cybersource-rest-client-ruby
```
    $ gem install cyberSource_client
```
* Run the individual samples by name. For example: 
```
    $ Ruby [DirectoryPath]\[CodeSampleName]
```
e.g.
```
    $ Ruby Samples\Payments\CoreServices\proce.rb
```
