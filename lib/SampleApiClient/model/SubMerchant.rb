public
# Model Class for SubMerchant
class SubMerchant
  public 
  def initialize(cardAcceptorID,country,phoneNumber,address1,postalCode,locality,name,administrativeArea,
    region,email)
    @cardAcceptorID = cardAcceptorID
    @country = country
    @phoneNumber = phoneNumber
    @address1 = address1
    @postalCode = postalCode
    @locality = locality
    @name = name
    @administrativeArea = administrativeArea
    @region = region
    @email = email
  end
  attr_accessor :cardAcceptorID
  attr_accessor :country
  attr_accessor :phoneNumber
  attr_accessor :address1
  attr_accessor :postalCode
  attr_accessor :locality
  attr_accessor :name
  attr_accessor :administrativeArea
  attr_accessor :region
  attr_accessor :email
end