require_relative "IngredientList"
class Pantry < IngredientList
  require 'set'

    def ingredients
    self.to_set.to_a
  end

end
