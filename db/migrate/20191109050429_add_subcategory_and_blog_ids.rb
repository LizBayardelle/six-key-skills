class AddSubcategoryAndBlogIds < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :subcategory_ids, :text, array: true
    add_column :subcategories, :blog_ids, :text, array: true
  end
end
