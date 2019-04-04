public
# Model Class for AmountDetails 
class AmountDetails
  public
  def initialize(totalAmount, currency)
    @totalAmount = totalAmount
    @currency = currency
  end
  attr_accessor :totalAmount
  attr_accessor :currency
end
