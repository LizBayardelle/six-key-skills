class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.string :first_name
      t.string :email
      t.boolean :member, default: false
      t.integer :lead_magnet_id

      t.timestamps
    end
  end
end
