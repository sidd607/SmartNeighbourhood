class AddDataTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :data_type, :integer
  end
end
