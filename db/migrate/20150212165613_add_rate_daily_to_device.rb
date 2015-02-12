class AddRateDailyToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :rate_daily, :money
  end
end
