class AddAttachmentNameToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :attachment_name, :string
  end
end
