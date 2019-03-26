require_relative 'spec_helper'
require_relative '../../AuthenticationSDK/spec/MerchantConfigData.rb'
require_relative '../../AuthenticationSDK/core/MerchantConfig.rb'
require_relative '../controller/APIController.rb'
require_relative '../connection/HttpConnection.rb'
require_relative '../../AuthenticationSDK/util/Constants.rb'
require_relative '../../CyberSource-Authentication-SDK-ruby/data/RequestData.rb'

describe APIController do
        
    it "validating HTTP get Api Controller" do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp                  
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType="Http_signature"
        id="5246387105766473203529" #capture-5289697403596987704107
        requestTarget="/pts/v2/payments/" + id
        merchantconfig_obj.requestTarget=requestTarget
        url= ENV["HttpsUriPrefix"] + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType=ENV["getRequestType"]
        responsecode,responseBody,v_c_correlationId= APIController.new.payment_get(merchantconfig_obj)
        expect(responsecode).not_to be_empty
    end
    it "validating HTTP post Api Controller" do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp                  
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType="Http_signature"
        requestTarget="/pts/v2/payments"
        requestJsonPath='../../../AuthenticationSDK/spec/PostRequestData.json'
        merchantconfig_obj.requestTarget=requestTarget
        url= ENV["HttpsUriPrefix"] + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType=ENV["postRequestType"]
        merchantconfig_obj.requestJsonData=RequestData.new.samplePaymentsData
        responsecode,responseBody,v_c_correlationId= APIController.new.payment_post(merchantconfig_obj)
        expect(responsecode).not_to be_empty
    end
    it "validating HTTP put Api Controller" do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp                  
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType="Http_signature"
        requestJsonPath='../../../AuthenticationSDK/spec/PutRequestData.json'
        requestTarget="/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest"
        merchantconfig_obj.requestTarget=requestTarget
        url= ENV["HttpsUriPrefix"] + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType=ENV["putRequestType"]
        merchantconfig_obj.requestJsonData=RequestData.new.jsonFileData(File.expand_path(requestJsonPath,__FILE__))
        responsecode,responseBody,v_c_correlationId= APIController.new.payment_put(merchantconfig_obj)
        expect(responsecode).not_to be_empty
    end
    it "validating HTTP delete Api Controller" do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp                  
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType="Http_signature"
        id="5246387105766473203529"
        requestTarget="/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest"
        merchantconfig_obj.requestTarget=requestTarget
        url= ENV["HttpsUriPrefix"] + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType=ENV["deleteRequestType"]
        responsecode,responseBody,v_c_correlationId= APIController.new.payment_delete(merchantconfig_obj)
        expect(responsecode).not_to be_empty
    end
    it "validating JWT get Api Controller" do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp                 
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType="JWT"
        requestTarget="/pts/v2/payments"
        merchantconfig_obj.requestTarget=requestTarget
        getId="5246387105766473203529" #capture-5289697403596987704107
        url= ENV["HttpsUriPrefix"] + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget + "/" 
        url = url + getId
        merchantconfig_obj.requestUrl=url  
        merchantconfig_obj.requestType=ENV["getRequestType"]
        responsecode,responseBody,v_c_correlationId= APIController.new.payment_get(merchantconfig_obj)
        expect(responsecode).not_to be_empty
    end
    it "validating JWT post Api Controller" do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp                  
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType="JWT"
        requestTarget="/pts/v2/payments"
        requestJsonPath='../../../AuthenticationSDK/spec/PostRequestData.json'
        merchantconfig_obj.requestTarget=requestTarget
        url= ENV["HttpsUriPrefix"] + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url  
        merchantconfig_obj.requestType=ENV["postRequestType"]
        merchantconfig_obj.requestJsonData=RequestData.new.samplePaymentsData
        responsecode,responseBody,v_c_correlationId= APIController.new.payment_post(merchantconfig_obj)
        expect(responsecode).not_to be_empty
    end
    it "validating JWT put Api Controller" do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp                  
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType="JWT"
        requestTarget="/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest"
        requestJsonPath='../../../AuthenticationSDK/spec/PutRequestData.json'
        merchantconfig_obj.requestTarget=requestTarget
        url= ENV["HttpsUriPrefix"] + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url   
        merchantconfig_obj.requestType=ENV["putRequestType"]
        merchantconfig_obj.requestJsonData=RequestData.new.jsonFileData(File.expand_path(requestJsonPath,__FILE__))
        responsecode,responseBody,v_c_correlationId= APIController.new.payment_put(merchantconfig_obj)
        expect(responsecode).not_to be_empty
    end
    it "validating JWT delete Api Controller" do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp                  
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType="JWT"
        requestTarget="/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest"
        merchantconfig_obj.requestTarget=requestTarget
        url= ENV["HttpsUriPrefix"] + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url   
        merchantconfig_obj.requestType=ENV["deleteRequestType"]
        responsecode,responseBody,v_c_correlationId= APIController.new.payment_put(merchantconfig_obj)
        expect(responsecode).not_to be_empty
    end
end