class RemoveLeadMagnetColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscribers, :lead_magnet_id
    remove_column :blogs, :lead_magnet_id
  end
end
