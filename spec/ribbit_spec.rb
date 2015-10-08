require_relative "../lib/ribbit.rb"

describe Ribbit do
  before :each do
    @ribbit = Ribbit.new(income: 50000, zipcode: 60201, age: 35)
  end

  describe "#initialize" do
    it "takes a hash argument and returns a Ribbit object" do
      expect(@ribbit).to be_a(Ribbit)
    end
  end

end