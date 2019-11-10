class RemoveArrayFromSubcategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :subcategory_ids
    remove_column :subcategories, :blog_ids
    add_column :blogs, :subcategory_id_list_string, :string
    add_column :subcategories, :blog_id_list_string, :string
  end
end
