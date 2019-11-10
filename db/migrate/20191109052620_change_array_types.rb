class ChangeArrayTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs, :subcategory_ids, :string, array: true
    change_column :subcategories, :blog_ids, :string, array: true
  end
end
