class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :rate
      t.timestamp :rated_at
      t.integer :type
      t.string :Description

      t.timestamps null: false
    end
    add_foreign_key :ratings, :users
  end
end
