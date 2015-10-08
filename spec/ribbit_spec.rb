require_relative "../lib/ribbit.rb"

describe Ribbit do
  before :each do
    @ribbit = Ribbit.new(income: 50000, zipcode: 60201, age: 35)
  end

  describe "#initialize" do
    it "takes a hash argument and returns a Ribbit object" do
      expect(@ribbit).to be_a(Ribbit)
    end

    it "Makes income a readable value" do
      expect(@ribbit.income).to eq(50000)
    end

    it "Makes zipcode a readable value" do
      expect(@ribbit.zipcode).to eq(60201)
    end

    it "Makes age a readable value" do
      expect(@ribbit.age).to eq(35)
    end
  end

end