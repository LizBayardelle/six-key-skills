class AddPossibleTotalsToSittings < ActiveRecord::Migration[5.2]
  def change
    add_column :sittings, :possible_results, :string
    add_column :sittings, :possible_compiled_results, :string, array: true, default: []
  end
end
