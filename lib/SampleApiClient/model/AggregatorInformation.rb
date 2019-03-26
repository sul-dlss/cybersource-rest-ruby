public 
# Model Class for AggregatorInformation 
class AggregatorInformation
  public
  def initialize(subMerchant, name, aggregatorID)
    @subMerchant = subMerchant
    @name = name
    @aggregatorID = aggregatorID
  end
  attr_accessor :subMerchant
  attr_accessor :name
  attr_accessor :aggregatorID
end
