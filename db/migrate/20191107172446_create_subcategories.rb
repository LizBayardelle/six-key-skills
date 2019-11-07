class CreateSubcategories < ActiveRecord::Migration[5.2]
  def change

    create_table :subcategories do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true
      t.timestamps
    end

    create_table :blog_categorizations do |t|
      t.belongs_to :blog
      t.belongs_to :subcategory
      t.timestamps
    end

  end
end
