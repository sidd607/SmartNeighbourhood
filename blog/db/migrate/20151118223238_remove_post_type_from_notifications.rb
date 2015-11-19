class RemovePostTypeFromNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :post_type, :integer
  end
end
