class AddPasswordDigestToAuthenticates < ActiveRecord::Migration
  def change
    add_column :authenticates, :password_digest, :string
  end
end
