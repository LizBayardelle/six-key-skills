class RenameTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :lead_magnets, :type, :lead_magnet_type
  end
end
