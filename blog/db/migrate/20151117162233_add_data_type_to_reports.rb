class AddDataTypeToReports < ActiveRecord::Migration
  def change
    add_column :reports, :data_type, :integer
  end
end
