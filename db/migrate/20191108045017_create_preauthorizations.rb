class CreatePreauthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :preauthorizations do |t|
      t.string :email
      t.boolean :admin, default: false
      t.boolean :contributor, default: false
      t.boolean :fulfilled, default: false

      t.timestamps
    end
  end
end
