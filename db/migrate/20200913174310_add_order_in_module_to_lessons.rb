class AddOrderInModuleToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :order_in_module, :integer
  end
end
