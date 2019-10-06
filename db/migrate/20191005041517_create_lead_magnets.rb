class CreateLeadMagnets < ActiveRecord::Migration[5.2]
  def change
    create_table :lead_magnets do |t|
      t.string :title
      t.text :description
      t.boolean :motivation, default: false
      t.boolean :mindset, default: false
      t.boolean :resourcing, default: false
      t.boolean :planning, default: false
      t.boolean :time_management, default: false
      t.boolean :discipline, default: false
      t.string :type
      t.string :link_url
      t.boolean :active, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
