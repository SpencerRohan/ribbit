require 'net/http'
require 'json'

class Ribbit
  attr_reader :income, :zipcode, :age

  def initialize(consumer_data = {})
    @income  = consumer_data[:income]  || nil
    @zipcode = consumer_data[:zipcode] || nil
    @age     = consumer_data[:age]     || nil
    check_data
  end

  def request
    "http://not_real.com/customer_scoring?income=#{income}&zipcode=#{zipcode}&age=#{age}"
  end

  private

  def check_data
    data = [@income, @zipcode, @age]
    data.each do |value|
      raise ArgumentError.new("Missing crucial consumer data") if value.nil?
      raise ArgumentError.new("Data values must be an integer") if !value.is_a?(Fixnum)
    end
  end

end