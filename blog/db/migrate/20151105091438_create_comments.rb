class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :description
      t.integer :type
      t.timestamp :createdate
      t.integer :report

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
  end
end
