class AddCaloriesToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :calorie, :integer
  end
end
