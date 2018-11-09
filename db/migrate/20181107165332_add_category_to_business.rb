class AddCategoryToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :category, index: true
    add_foreign_key :businesses, :categories
  end
end
