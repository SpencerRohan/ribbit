require_relative "../lib/ribbit.rb"
require 'webmock/rspec'

describe Ribbit do
  let(:ribbit) { Ribbit.new(income: 50000, zipcode: 60201, age: 35) }
  let(:badribbit1) { Ribbit.new(income: "50000", age: "35") }
  let(:badribbit2) { Ribbit.new(income: "50000", zipcode: 60201, age: 35) }

  describe "#initialize" do
    it "takes a hash argument and returns a Ribbit object" do
      expect(ribbit).to be_a(Ribbit)
    end

    it "Makes #income a readable value" do
      expect(ribbit.income).to eq(50000)
    end


    it "Makes #zipcode a readable value" do
      expect(ribbit.zipcode).to eq(60201)
    end

    it "Makes #age a readable value" do
      expect(ribbit.age).to eq(35)
    end

    it "raises errors if any consumer data is missing" do
      expect{ badribbit1 }.to raise_error(ArgumentError)
    end

    it "raises errors if any consumer data is not a fixnum" do
      expect{ badribbit2 }.to raise_error(ArgumentError)
    end

  end

  describe "#destination" do
    it "returns a string" do
      expect(ribbit.destination).to be_a(String)
    end

    it "returns a url using consumer data as params" do
      expect(ribbit.destination).to eq("http://notreal.com/customerscoring?income=50000&zipcode=60201&age=35")
    end
  end

  describe "#request" do
    it "should return a proper hash object" do
      WebMock.stub_request(:get, 'http://notreal.com/customerscoring?age=35&income=50000&zipcode=60201').to_return(:body   => {propensity: 0.26532,
                              ranking: 'C'}.to_json,
                  :status => 200)
      expect(ribbit.request).to eq({ "propensity" => 0.26532,
                                      "ranking"    => "C"})
    end

    it "should raise an error if request fails" do
      WebMock.stub_request(:get, 'http://notreal.com/customerscoring?age=35&income=50000&zipcode=60201').to_return(:body   => {propensity: 0.26532,
                              ranking: 'C'}.to_json,
                  :status => 404)
      expect{ ribbit.request }.to raise_error(ArgumentError)
    end
  end

end