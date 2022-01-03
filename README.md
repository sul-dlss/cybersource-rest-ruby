# Download the Payment Batch Detail Report using the CyberSource SDK

This LibSys repository is a hard fork and heavily modified and pruned version of the [CyberSource working code sample](https://github.com/CyberSource/cybersource-rest-samples-ruby) which demonstrates Ruby 
integration with the CyberSource REST APIs through the [CyberSource Ruby SDK](https://github.com/CyberSource/cybersource-rest-client-ruby).

## Requirements
* Ruby 2.2.2 or higher
* [CyberSource Account](https://developer.cybersource.com/api/developer-guides/dita-gettingstarted/registration.html)
* [CyberSource API Keys](https://developer.cybersource.com/api/developer-guides/dita-gettingstarted/registration/createCertSharedKey.html)

## Running the Samples From the Command Line
* Clone this repository:
```
    $ git clone https://github.com/sul-dlss/cybersource-rest-ruby
```
* Install the cybersource-rest-client-ruby (from RubyGems.org)
```
    $ gem install cybersource_rest_client
```
* Run the report: 
```
    $ STAGE=dev ruby CyberSource/download_payment_batch_detail_report.rb
```

## Setting the API credentials for an API request

Configure the following information in the settings file:
  
  * Http Signature 
```yml
configurationDictionary:
  merchantID: 'wfgsulair'
  runEnvironment: 'cybersource.environment.production'
  timeout: 1000 # In Milliseconds
  authenticationType: 'http_signature'
  enableLog: false
  merchantsecretKey: 'your_key_serial_number'
  merchantKeyId: 'your_key_shared_secret'
```

Obtain the merchantsecretKey and merchantKeyId from the CyberSource Business Center.
You will need permissions from merchants@stanford.edu to access the CyberSource Business Center
with the option to generate security keys.

## Switching between the sandbox environment and the production environment
CyberSource maintains a complete sandbox environment for testing and development purposes. This sandbox environment is an exact 
duplicate of our production environment with the transaction authorization and settlement process simulated. By default, this sample code is 
configured to communicate with the sandbox environment. To switch to the production environment, set the appropriate environment 
constant in config/settings/#{stage} file.  For example:

#### For PRODUCTION use
```yml
configurationDictionary:
  merchantID: 'wfgsulair'
  runEnvironment: 'cybersource.environment.production'
  ...
```
#### For TESTING use
```yml
configurationDictionary:
  merchantID: 'wfgsulair'
  runEnvironment: 'cybersource.environment.sandbox'
  ...
```

## CyberSource API Reference

The [API Reference Guide](http://developer.cybersource.com/api/reference) provides examples of what information is needed for a particular request and how that information would be formatted. Using those examples, you can easily determine what methods would be necessary to include that information in a request using this SDK.

