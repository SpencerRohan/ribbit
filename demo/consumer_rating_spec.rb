require_relative "consumer_rating_demo.rb"
require 'webmock/rspec'

describe Consumer_Rating do
  let(:rater) { Consumer_Rating.new( income:  50000,
                                     zipcode: 60201,
                                     age:     35 )}
  before(:each) do
   WebMock.stub_request(:get, 'http://notreal.com/customerscoring?age=35&income=50000&zipcode=60201').to_return(:body   => {propensity: 0.26532,
                           ranking: 'C'}.to_json,
               :status => 200)
  end

  describe "#initialize" do
    it "Makes #ranking a readable value" do
      expect(rater.ranking).to eq('C')
    end

    it "Makes #propensity a readable value" do
      expect(rater.propensity).to eq(2.26532)
    end
  end

  describe "#display" do
    it "Prints consumer's ranting values to standard out" do
      expect{ rater.display }.to output("Ranking: C, Propensity: 2.26532").to_stdout
    end
  end

end