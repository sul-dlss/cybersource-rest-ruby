require 'json'
class Masking
  # Masking function
  def maskPayload(reqJson)
    if !reqJson.to_s.empty?
      res=""
      jsonStr = JSON.parse(reqJson)
      filter_parameters = ["expirationMonth","expirationYear","email","firstName","lastName","phoneNumber","number","securityCode","type"]
      filter_parameters.each do |param|
        res = iterate(jsonStr,param)
      end
      maskedData = JSON.generate(res)
      return maskedData
    end
  end
  def iterate(reqJson,param)
    reqJson.each do |key,value|
      if key == param && value.is_a?(String)
        value.replace "XXXXXXXX"
      elsif value.is_a?(Hash)
        iterate(value,param)
      elsif value.is_a?(Array)
        value.flatten.each {|x| iterate(x,param) if x.is_a?(Hash)}
      end
    end
    return reqJson
  end
end