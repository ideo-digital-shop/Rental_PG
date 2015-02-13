class AddRateDailyToRental < ActiveRecord::Migration
  def change
    add_column :rentals, :rate_daily, :money
  end
end
