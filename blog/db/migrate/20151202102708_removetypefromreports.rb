class Removetypefromreports < ActiveRecord::Migration
  def change
    remove_column :reports, :type, :integer
  end
end
