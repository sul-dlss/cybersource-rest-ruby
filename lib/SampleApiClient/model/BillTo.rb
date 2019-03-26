public
# Model Class for BillTo
class BillTo
  public
  def initialize(country, lastName, address2, address1, postalCode, 
    locality, administrativeArea, firstName, phoneNumber, district, 
    buildingNumber, company, email)
    @country = country
    @lastName = lastName
    @address2 = address2
    @address1 = address1
    @postalCode = postalCode
    @locality = locality
    @administrativeArea = administrativeArea
    @firstName = firstName
    @phoneNumber = phoneNumber
    @district = district
    @buildingNumber = buildingNumber
    @company = company
    @email = email
  end
  attr_accessor :country
  attr_accessor :lastName
  attr_accessor :address2
  attr_accessor :address1
  attr_accessor :postalCode
  attr_accessor :locality
  attr_accessor :administrativeArea
  attr_accessor :firstName
  attr_accessor :phoneNumber
  attr_accessor :district
  attr_accessor :buildingNumber
  attr_accessor :company
  attr_accessor :email
end
