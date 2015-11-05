class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :community_id
      t.integer :user_id
      t.string :title
      t.string :body
      t.timestamp :create_date
      t.timestamp :update_date
      t.integer :type
      t.integer :priority
      t.integer :report
      t.float :rating
      t.integer :rateCount

      t.timestamps null: false
    end
    add_foreign_key :posts, :communities
    add_foreign_key :posts, :users
  end
end
