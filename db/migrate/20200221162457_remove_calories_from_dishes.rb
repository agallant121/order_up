class RemoveCaloriesFromDishes < ActiveRecord::Migration[5.1]
  def change
    remove_column :dishes, :calorie, :integer
  end
end
