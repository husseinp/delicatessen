#!/usr/bin/env ruby

require "highline/import"
require_relative "Sandwich"
require_relative "Ingredient"
require_relative "SandwichPresenter"
require_relative "Pantry"

# this is what the deli serves
@veggies = %w(lettuce tomato pickle sauerkraut cucumber)
@breads =  %w(sourdough rye white brown)
@meats  =  %w(turkey roastbeef ham salami)
@condiments = %w(mustard mayo aioli relish horseradish)

# stock the pantry
@pantry = Pantry.new
@breads.each {|i| @pantry << Ingredient.new(i, :bread) }
@meats.each {|i| @pantry << Ingredient.new(i, :meat) }
@veggies.each {|i| @pantry << Ingredient.new(i, :veggie) }
@condiments.each {|i| @pantry << Ingredient.new(i, :condiment) }

@categories = @pantry.group_by { |i| i.type }

@sandwich = Sandwich.new
@sandwich_presenter = SandwichPresenter.new

say("Welcome to Patni's Delicatessen. We have great sandwiches.\n\n\n")
loop do
  choose do |menu|
    menu.prompt = "What would you like on your sandwich?"
    say HighLine::RED
    @categories.each do |category, ingredients|
      menu.choice(category) do
        choose do |submenu|
          submenu.header = category
          submenu.prompt = "What kind of #{category} would you like?"
          ingredients.each do |ingredient|
            submenu.choice(ingredient.name) do
              @sandwich << ingredient
            end
          end
        end
      end
      say HighLine::RESET
    end

    menu.choices(:display, :purchase) do |c|
      @sandwich_presenter.sandwich = @sandwich

      say HighLine::BOLD
      say @sandwich_presenter.display
      say HighLine::RESET

      if c == :purchase
        say HighLine::GREEN
        say "Thanks for shopping at the Deli."
        say HighLine::RESET
        exit
      end

    end
  end
end
