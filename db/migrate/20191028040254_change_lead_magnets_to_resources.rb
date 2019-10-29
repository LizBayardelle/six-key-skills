class ChangeLeadMagnetsToResources < ActiveRecord::Migration[5.2]
  def change
    rename_table :lead_magnets, :resources
  end
end
