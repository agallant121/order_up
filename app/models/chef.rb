class Chef <ApplicationRecord
  validates_presence_of :name

  has_many :dishes

   # def unique_ingredients
   #   Ingredient.select(:name).joins(:dishes).distinct
   # end
end
