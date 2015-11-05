class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :pincode
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
