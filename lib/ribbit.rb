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

  def destination
    "http://notreal.com/customerscoring?income=#{income}&zipcode=#{zipcode}&age=#{age}"
  end

  def request
    response = Net::HTTP.get_response(URI(destination))
    if response.code == "200"
      scoring = JSON.parse(response.body)
    else
      raise ArgumentError.new("HTTP Request was not made successfully")
    end
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