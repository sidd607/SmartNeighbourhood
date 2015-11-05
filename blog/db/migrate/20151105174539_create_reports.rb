class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :type
      t.integer :profile_id
      t.string :reason
      t.timestamp :reported_at

      t.timestamps null: false
    end
    add_foreign_key :reports, :users
  end
end
