public 
# Model Class for OrderInformation
class OrderInformation
  public 
  def initialize(billTo, amountDetails)
    @billTo = billTo
    @amountDetails = amountDetails
  end
  attr_accessor :billTo
  attr_accessor :amountDetails
end
