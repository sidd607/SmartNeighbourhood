class AddDataTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :data_type, :integer
  end
end
