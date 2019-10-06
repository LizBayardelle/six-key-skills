class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :teaser
      t.text :body
      t.boolean :motivation, default: false
      t.boolean :mindset, default: false
      t.boolean :resourcing, default: false
      t.boolean :planning, default: false
      t.boolean :time_management, default: false
      t.boolean :discipline, default: false
      t.string :image_url
      t.text :pinterest_description
      t.boolean :published, default: false
      t.datetime :published_at
      t.boolean :approved, default: false
      t.boolean :featured, default: false
      t.references :lead_magnet, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
