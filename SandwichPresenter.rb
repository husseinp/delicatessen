class SandwichPresenter
  attr_accessor :sandwich

  def display
    output = String.new
    output = 'You haven\'t selected any toppings.' if @sandwich.empty?
    all_ingredients = @sandwich.ingredients.group_by { |i| i.type }
    all_ingredients.each do |type, ingredients|
      output << "#{type}:\n"
      ingredients.each do |ingredient|
        output << "\t#{ingredient.name}\n"
      end
    end
    output
  end
end
