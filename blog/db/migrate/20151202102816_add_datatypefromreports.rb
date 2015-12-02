class AddDatatypefromreports < ActiveRecord::Migration
  def change
    add_column :reports, :data_type, :integer
    add_column :reports, :community_id, :integer
  end
end
