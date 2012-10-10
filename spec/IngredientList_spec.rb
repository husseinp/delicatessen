require 'spec_helper'

describe IngredientList do

  before :each do
    @ingredients = IngredientList.new
  end

  describe "#new" do
    it "creates a list of ingredients" do
      @ingredients.should be_an_instance_of IngredientList
    end
  end

  describe "#ingredients" do
    it "returns a list of ingredients" do
      @ingredients.ingredients.should be_a_kind_of(Array)
    end
  end
  
  describe "#add_ingredient" do
    it "adds and ingredient to the list" do
      lettuce = stub('Ingredient')
      
      @ingredients.add_ingredient(lettuce)
      @ingredients.should include(lettuce)
    end
  end
  
end
