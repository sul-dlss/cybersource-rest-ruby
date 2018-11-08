# Ruby Sample Code for the CyberSource SDK
This repository contains working code samples which demonstrate Ruby integration with the CyberSource REST APIs through the CyberSource Ruby SDK.

**__NOTE: THIS REPO OF CODE SAMPLES HAS BEEN MADE PUBLIC FOR SDK TESTING AND SHOULD NOT BE USED FOR PRODUCTION - YET.  PLEASE RAISE AN ISSUE ON THIS REPO IF YOU HAVE FURTHER QUESTIONS AND CHECK BACK SOON FOR GENERAL AVAILABILITY__**

The samples are organized into categories and common usage examples.


## Using the Sample Code

The samples are all completely independent and self-contained. You can analyze them to get an understanding of how a particular method works, or you can use the snippets as a starting point for your own project.

You can also run each sample directly from the command line.

## Requirements
* Ruby 2.2.2 or higher
* [CyberSource Account](https://developer.cybersource.com/api/developer-guides/dita-gettingstarted/registration.html)
* [CyberSource API Keys](https://prod.developer.cybersource.com/api/developer-guides/dita-gettingstarted/registration/createCertSharedKey.html)

## Running the Samples From the Command Line
* Clone this repository:
```
    $ git clone https://github.com/CyberSource/cybersource-rest-samples-ruby
```
* Install the cybersource-rest-client-ruby
```
    $ gem install cybersource_rest_client
```
* Run the individual samples by name. For example: 
```
    $ Ruby [DirectoryPath]\[CodeSampleName]
```
e.g.
```
    $ ruby Samples/Payments/CoreServices/ProcessPayment.rb
```

#### To set your own API credentials for an API request, configure the following information in resource/cybs.yml file:
  
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
duplicate of our production environment with the transaction authorization and settlement process simulated. By default, this sample code is 
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

## API Reference

The [API Reference Guide](http://developer.cybersource.com/api/reference) provides examples of what information is needed for a particular request and how that information would be formatted. Using those examples, you can easily determine what methods would be necessary to include that information in a request using this SDK.

