class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :post_id
      t.integer :profile_id
      t.integer :type

      t.timestamps null: false
    end
    add_foreign_key :tags, :profiles
  end
end
