class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :profile_id
      t.integer :post_id
      t.text :options
      t.text :user_response
      t.integer :interim
      t.timestamp :finish_time
      t.integer :anonimity
      t.integer :vote_type
      t.integer :community_id
      t.integer :restricted_id

      t.timestamps null: false
    end
    add_foreign_key :polls, :profiles
    add_foreign_key :polls, :posts
    add_foreign_key :polls, :communities
  end
end
