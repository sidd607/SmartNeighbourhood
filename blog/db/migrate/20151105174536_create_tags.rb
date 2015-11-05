class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :user_id
      t.integer :post_id
      t.integer :type

      t.timestamps null: false
    end
    add_foreign_key :tags, :users
  end
end
