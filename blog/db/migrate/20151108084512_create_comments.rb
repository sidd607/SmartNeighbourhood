class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :profile_id
      t.string :description
      t.integer :type
      t.timestamp :createdate
      t.integer :report

      t.timestamps null: false
    end
    add_foreign_key :comments, :profiles
  end
end
