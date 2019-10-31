class ChangeResourceIdToArray < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscribers, :resource_id
    add_column :subscribers, :resource_id_array, :text, array: true, default: []
  end
end
