class CreateYellowpages < ActiveRecord::Migration
  def change
    create_table :yellowpages do |t|
      t.integer :user_id
      t.string :name
      t.string :phone
      t.string :address
      t.string :description
      t.integer :verified
      t.integer :community_id
      t.float :AveRating
      t.integer :totalRatings

      t.timestamps null: false
    end
    add_foreign_key :yellowpages, :users
    add_foreign_key :yellowpages, :communities
  end
end
