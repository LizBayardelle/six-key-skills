class AddCompiledPercentagesToSittings < ActiveRecord::Migration[5.2]
  def change
    add_column :sittings, :compiled_percentages, :string, array: true, default: []
  end
end
