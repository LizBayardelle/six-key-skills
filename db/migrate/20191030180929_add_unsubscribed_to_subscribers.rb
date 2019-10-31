class AddUnsubscribedToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :unsubscribed, :boolean, default: false
  end
end
