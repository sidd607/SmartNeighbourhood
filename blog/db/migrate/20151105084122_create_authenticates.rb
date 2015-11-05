class CreateAuthenticates < ActiveRecord::Migration
  def change
    create_table :authenticates do |t|
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
