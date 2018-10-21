require 'openssl'
public
class VerifyToken
    def verify(publicKey, postParam)
        signedFields = Array.new
        getSignedFields =  Array.new
        signedValues = ""
        signature = ""
        if postParam.signed_fields.to_s.empty?
            raise StandardError.new ("Missing required field: signedFields")
        else
            signedFields = postParam.signed_fields.split(',')
        end
        # Calling CamelCasetoUnderscore to convert Camel case to snake_case
        signedFields.each do |field|
            getSignedFields << CamelCasetoUnderscore(field)
        end
        # Getting signedValues field from postParam
        getSignedFields.each do |value|
            signedValues << ','
            signedValues << (postParam.instance_variable_get(("@"+value).intern)).to_s
        end
        if signedValues.length > 0
            signedValues.slice!(0)
        end
        if postParam.signature.to_s.empty?
            raise StandardError.new ("Missing required field: signature")
        else
            signature = postParam.signature
        end
        stringToPem = "-----BEGIN PUBLIC KEY-----\n#{publicKey}\n-----END PUBLIC KEY-----\n"
        public_key = OpenSSL::PKey::RSA.new(stringToPem)
        verify = public_key.verify(OpenSSL::Digest::SHA512.new, Base64.decode64(signature), signedValues)
    rescue StandardError => err 
        puts err.message
        puts err.backtrace
    end
    # Converting response field from camelCase to Underscore
    def CamelCasetoUnderscore(str)
        str.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
    end
end