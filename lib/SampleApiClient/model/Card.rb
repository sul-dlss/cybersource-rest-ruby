public 
# Model Class for card
class Card
  public 
  def initialize(expirationYear, number, securityCode, expirationMonth, type)
    @expirationYear = expirationYear
    @number = number
    @securityCode = securityCode
    @expirationMonth = expirationMonth
    @type = type
  end
  attr_accessor :expirationYear
  attr_accessor :number
  attr_accessor :securityCode
  attr_accessor :expirationMonth
  attr_accessor :type
end
