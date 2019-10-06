class AddPrimaryCategoryToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :primary_category, :string
  end
end
