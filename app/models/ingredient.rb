class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :calorie_count

  has_many :ingredient_dishes
  has_many :dishes, through: :ingredient_dishes


  # def unique_ingredients
  #   require "pry"; binding.pry
  #   Ingredient.select(:name).joins(:dishes).distinct
  # end
end
