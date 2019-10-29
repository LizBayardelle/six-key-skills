class RemoveIndexFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_index "blogs", name: "index_blogs_on_lead_magnet_id"
  end
end
