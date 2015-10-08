require 'ribbit'

class Consumer_Rating
  attr_reader :ranking, :propensity

  def initialize(consumer_data)
    request = Ribbit.new(consumer_data).request
    @ranking = request['ranking']
    @propensity = calculate_propensity(request['propensity'])
  end

  private

  def calculate_propensity(numerical_score)
    numerical_score + 2
  end

end