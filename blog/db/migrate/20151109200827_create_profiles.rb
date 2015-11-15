class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstName
      t.string :LastName
      t.string :gender
      t.date :DOB
      t.string :phone
      t.string :email
      t.integer :verified
      t.integer :verify_id
      t.integer :inactive
      t.integer :role_id
      t.integer :community_id
      t.integer :showPhone
      t.timestamp :verifytime
      t.string :door_no

      t.timestamps null: false
    end
    add_foreign_key :profiles, :roles
    add_foreign_key :profiles, :communities
  end
end
