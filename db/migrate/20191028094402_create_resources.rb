class CreateResources < ActiveRecord::Migration[5.2]
  def change
    drop_table :resources, force: :cascade
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.boolean :general, default: false
      t.boolean :motivation, default: false
      t.boolean :mindset, default: false
      t.boolean :resourcing, default: false
      t.boolean :planning, default: false
      t.boolean :time_management, default: false
      t.boolean :discipline, default: false
      t.string :resource_type
      t.string :link_url
      t.boolean :active, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_reference :blogs, :resource, foreign_key: true
    add_reference :subscribers, :resource, foreign_key: true
  end
end
