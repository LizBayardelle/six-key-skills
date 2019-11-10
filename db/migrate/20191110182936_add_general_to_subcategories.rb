class AddGeneralToSubcategories < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :general, :boolean, default: false
  end
end
