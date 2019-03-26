public
# Model Class for Payments
class Payments
  public 
  def initialize(clientReferenceInformation, processingInformation, aggregatorInformation, 
    orderInformation, paymentInformation)
    @clientReferenceInformation = clientReferenceInformation
    @processingInformation = processingInformation
    @aggregatorInformation = aggregatorInformation
    @orderInformation = orderInformation
    @paymentInformation = paymentInformation
  end
  attr_accessor :clientReferenceInformation
  attr_accessor :processingInformation
  attr_accessor :aggregatorInformation
  attr_accessor :orderInformation
  attr_accessor :paymentInformation
end
