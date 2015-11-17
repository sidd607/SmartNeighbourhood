class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :created_by
      t.integer :responded_by
      t.integer :post_id
      t.integer :post_type
      t.integer :view_stat

      t.timestamps null: false
    end
  end
end
