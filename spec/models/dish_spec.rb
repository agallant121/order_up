require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredient_dishes}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end

  it "instance method" do
    chef = Chef.create(name: "Alex")
    pasta = chef.dishes.create(name: "Pasta", description: "Wicked good")
    spice = Ingredient.create(name: "Spice", calorie_count: 100)
    flour = Ingredient.create(name: "Flour", calorie_count: 200)
    egg = Ingredient.create(name: "Egg", calorie_count: 300)

    pasta.ingredients << [spice, flour, egg]

    expect(pasta.total_calories).to eq(600)
  end

end
