class ChangeStartTimeTypeInAvailabilities < ActiveRecord::Migration[5.1]
  def change
    change_column :availabilities, :start_time, :datetime
  end
end
