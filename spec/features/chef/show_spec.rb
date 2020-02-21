require 'rails_helper'
 RSpec.describe "As a visitor" do
   before :each do
     @chef = Chef.create(name: "Alex")
     @pasta = @chef.dishes.create(name: "Pasta", description: "Wicked good")
     @pizza = @chef.dishes.create(name: "Pizza", description: "Delicious")

     @spice = Ingredient.create(name: "Spice", calorie_count: 100)
     @flour = Ingredient.create(name: "Flour", calorie_count: 200)
     @egg = Ingredient.create(name: "Egg", calorie_count: 300)

     @pep = Ingredient.create(name: "Pepperoni", calorie_count: 400)
     @cheese = Ingredient.create(name: "Mozzerella", calorie_count: 300)
     @dough = Ingredient.create(name: "Dough", calorie_count: 200)

     @pasta.ingredients << [@spice, @flour, @egg]
     @pizza.ingredients << [@pep, @cheese, @egg, @dough]

     visit "/chefs/#{@chef.id}"
   end

   it "shows chef's name, link to ingredients used" do
     expect(page).to have_content(@chef.name)

     click_link "Ingredients Used"
     expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
     
     expect(page).to have_content(@spice.name)
     expect(page).to have_content(@flour.name)
     expect(page).to have_content(@egg.name)
     expect(page).to have_content(@pep.name)
     expect(page).to have_content(@cheese.name)
     expect(page).to have_content(@dough.name)
   end
end

# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
