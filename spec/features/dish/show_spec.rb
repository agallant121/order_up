require 'rails_helper'
 RSpec.describe "As a visitor" do
   before :each do
     @chef = Chef.create(name: "Alex")
     @pasta = @chef.dishes.create(name: "Pasta", description: "Wicked good")
     @spice = Ingredient.create(name: "Spice", calorie_count: 100)
     @flour = Ingredient.create(name: "Flour", calorie_count: 200)
     @egg = Ingredient.create(name: "Egg", calorie_count: 300)

     @pasta.ingredients << [@spice, @flour, @egg]

     visit "/dishes/#{@pasta.id}"
   end

   it "shows the name of the chef and the ingredients for the dish" do
     expect(page).to have_content(@pasta.name)
     expect(page).to have_content(@chef.name)
     expect(page).to have_content(@spice.name)
     expect(page).to have_content(@flour.name)
     expect(page).to have_content(@egg.name)
   end

   it "shows total czlorie count for dish" do
     expect(page).to have_content("Total Calorie Count: 600")
   end
 end

 # Story 2 of 3
 # As a visitor
 # When I visit a dish's show page
 # I see the total calorie count for that dish

 # Story 1 of 3
 # As a visitor
 # When I visit a dish's show page
 # I see the name of the chef that made that dish
 # And I see a list of ingredients for that dish
