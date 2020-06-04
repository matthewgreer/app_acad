require 'rspec'
require 'dessert'
# require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do

  let(:chef) { double("chef", name: "Sven") }
  let(:cookie) {Dessert.new("cookie", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq("cookie") 
    end
    it "sets a quantity" do
      expect(cookie.quantity).to eq(10)
    end
    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to eq([])
    end
    context "when given a non-integer quantity" do
      it "raises an argument error" do
        expect {Dessert.new("fudge", "ten", chef)}.to raise_error(ArgumentError)
      end
    end
      
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cookie.add_ingredient("flour")).to eq(["flour"])
    end
    
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cookie.add_ingredient("milk")
      cookie.add_ingredient("sugar") 
      cookie.add_ingredient("butter")
      expect(cookie.mix!).to contain_exactly("sugar", "butter", "milk")
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cookie.eat(4)).to eq(6)
    end
    
    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(15) }.to raise_error(RuntimeError, "not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      # needed to include this line:
      allow(chef).to receive(:titleize).and_return("Chef Sven the Great Baker")
      # 
      expect(cookie.serve).to eq("Chef Sven the Great Baker has made 10 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      # needed following syntax
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
      # expect (cookie.temp).to eq(400)
    end
  end
end

# can't get the versions that call methods of the Chef class to work. the double
# doesn't seem able to call Chef instance methods. instantiating a Chef doesn't
# work either

# need to "allow(chef).to receive(:titleize).and_return ..."
