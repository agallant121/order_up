require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calorie_count}
  end

  describe "relationships" do
    it {should have_many :ingredient_dishes}
    it {should have_many(:dishes).through(:ingredient_dishes)}
  end

  # it "instance method" do
  #   spice = Ingredient.create(name: "Spice", calorie_count: 100)
  #   flour = Ingredient.create(name: "Flour", calorie_count: 200)
  #   egg = Ingredient.create(name: "Egg", calorie_count: 300)
  #
  #   pep = Ingredient.create(name: "Pepperoni", calorie_count: 400)
  #   cheese = Ingredient.create(name: "Mozzerella", calorie_count: 300)
  #   dough = Ingredient.create(name: "Dough", calorie_count: 200)
  #
  #   expect(Ingredient.unique_ingredients.count).to eq(6)
  # end
end
