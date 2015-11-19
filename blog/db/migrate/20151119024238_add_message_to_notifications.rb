class AddMessageToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :message, :string
  end
end
