class AddUseridInSurversurvertable < ActiveRecord::Migration
  def change
    add_column :survey_surveys, :user_id, :integer
  end
end
