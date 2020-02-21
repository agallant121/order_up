class RemoveCaloriesFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :calories, :integer
  end
end
