class CreatePollusers < ActiveRecord::Migration
  def change
    create_table :pollusers do |t|
      t.integer :poll_id
      t.integer :user_id
      t.integer :optionSelected

      t.timestamps null: false
    end
    add_foreign_key :pollusers, :polls
    add_foreign_key :pollusers, :users
  end
end
