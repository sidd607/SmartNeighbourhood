class RemoveTypeFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :type, :integer
  end
end
