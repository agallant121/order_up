class AddCaloriesCountToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :calorie_count, :integer
  end
end
