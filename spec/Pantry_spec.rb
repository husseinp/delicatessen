require 'spec_helper'

describe Pantry do

  before :each do
    @pantry = Pantry.new
  end

  context "duplicate items" do
    before :each do
      @lettuce = stub('Ingredient')
      @pantry.add_ingredient(@lettuce)
      @pantry.add_ingredient(@lettuce)      
    end

    describe "#ingredients" do
      it "has unique items" do
        @pantry.ingredients.should eql @pantry.uniq
      end
    end
  end
end
  
