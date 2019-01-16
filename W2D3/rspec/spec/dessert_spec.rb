require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cake) { Dessert.new("cake", 37, chef) }
  let(:chef) { double("chef", name: "Jay") }

  describe "#initialize" do
    it 'sets a type' do
      expect(cake.type).to eq('cake')
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(37)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "kat", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cake.add_ingredient("cheese")).to eq(["cheese"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(cake.mix!).to eq(cake.ingredients.shuffle)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cake.eat(10)).to eq(27)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(40) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jay the Great Baker")
      expect(cake.serve).to eq("Chef Jay the Great Baker has made 37 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).and_return(400)
      expect(cake.make_more).to eq(400)
    end
  end
end
