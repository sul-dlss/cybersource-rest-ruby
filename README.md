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
* Install the gems
```
    $ bundle
```
* Run the test report:
```
    $ SLEEP=0 rspec
```

## Create Persistent Volume
```
kubectl -n ${namespace} apply -f pv-volume.yaml
```

## Setting the API credentials for an API request

`vault kv get puppet/application/cybersource` contains the secrets needed to connect to Cybersource and fetch the reports.

Configure the `MERCHANT_KEY_ID` and `MERCHANT_SECRET_KEY` variables in the environment The variables for `STAGE`, `APP_PASSWORD` (for folio) and `APP_USERNAME` are configured using the `folio-k8s` folio secret.

Obtain the `merchantsecretKey` and `merchantKeyId` from the CyberSource Business Center.
You will need permissions from merchants@stanford.edu to access the CyberSource Business Center
with the option to generate security keys.

### Create secret with the Cybersource credentials
```
apiVersion: v1
kind: Secret
metadata:
  name: cybersource
type: Opaque
data:
  MERCHANT_KEY_ID: base64 encoded accessKey
  MERCHANT_SECRET_KEY: base64 encoded secretKey
  EMAIL_REPORT_TO: base64 encoded comma-seperatred list of email addresses
```
Then:
```
kubectl -n ${namespace} apply -f secret.yaml
```

### Create secret with sendmail config
Edit the sendmail.yaml, sendmail.mc: `SMART_HOST` entry to be the cluster mail host.
```
kubectl -n ${namespace} apply -f sendmail.yaml
```

## Run the ChronJob
```
kubectl -n ${namespace} apply -f cronjob.yaml
```

## Run the Debug pod
```
kubectl -n ${namespace} apply -f debug.yaml
```

Give sendmail a couple of minutes to restart before checking the /home/harvester/harvestlog directory.


## Switching between the sandbox environment and the production environment
CyberSource maintains a complete sandbox environment for testing and development purposes. This sandbox environment is an exact
duplicate of our production environment with the transaction authorization and settlement process simulated. By default, this sample code is
configured to communicate with the sandbox environment.
To switch to the sandbox environment, set the `CYBS_ENV=sandbox` environment variable.

## CyberSource API Reference

The [API Reference Guide](http://developer.cybersource.com/api/reference) provides examples of what information is needed for a particular request and how that information would be formatted. Using those examples, you can easily determine what methods would be necessary to include that information in a request using this SDK.

