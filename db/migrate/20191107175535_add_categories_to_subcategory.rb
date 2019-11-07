class AddCategoriesToSubcategory < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :motivation, :boolean, default: false
    add_column :subcategories, :mindset, :boolean, default: false
    add_column :subcategories, :resourcing, :boolean, default: false
    add_column :subcategories, :planning, :boolean, default: false
    add_column :subcategories, :time_management, :boolean, default: false
    add_column :subcategories, :discipline, :boolean, default: false
  end
end
