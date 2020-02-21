require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :calorie}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredient_dishes}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end
end
