class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
<<<<<<< HEAD
      t.integer :profile_complete
=======
>>>>>>> 9526bf19ba848e1d74d0d125f6015229d5d86de2

      t.timestamps null: false
    end
  end
end
