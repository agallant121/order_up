require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  it "instance method" do
    chef = Chef.create(name: "Alex")
    pasta = chef.dishes.create(name: "Pasta", description: "Wicked good")
    pizza = chef.dishes.create(name: "Pizza", description: "Delicious")

    spice = Ingredient.create(name: "Spice", calorie_count: 100)
    flour = Ingredient.create(name: "Flour", calorie_count: 200)
    egg = Ingredient.create(name: "Egg", calorie_count: 300)

    pep = Ingredient.create(name: "Pepperoni", calorie_count: 400)
    cheese = Ingredient.create(name: "Mozzerella", calorie_count: 300)
    dough = Ingredient.create(name: "Dough", calorie_count: 200)

    pasta.ingredients << [spice, flour, egg]
    pizza.ingredients << [pep, cheese, egg, dough]

    expect(chef.unique_ingredients.count).to eq(6)
  end
end
