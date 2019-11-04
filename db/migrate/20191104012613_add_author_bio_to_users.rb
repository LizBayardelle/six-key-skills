class AddAuthorBioToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :text
    add_column :users, :full_title, :string
    add_column :users, :website, :string
    add_column :users, :contributor_since, :datetime
    add_column :users, :location, :string
    add_column :users, :job_title, :string
    add_column :users, :company, :string
  end
end
