class AddClassificationToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :classification, :string
  end
end
