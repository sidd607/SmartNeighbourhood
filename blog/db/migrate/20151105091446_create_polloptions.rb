class CreatePolloptions < ActiveRecord::Migration
  def change
    create_table :polloptions do |t|
      t.integer :poll_id
      t.integer :option
      t.string :description
      t.integer :votecount

      t.timestamps null: false
    end
    add_foreign_key :polloptions, :polls
  end
end
