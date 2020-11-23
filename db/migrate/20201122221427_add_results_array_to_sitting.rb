class AddResultsArrayToSitting < ActiveRecord::Migration[5.2]
  def change
    add_column :sittings, :compiled_results, :string, array: true, default: []
  end
end
