class AddRateDailyToRentalRecord < ActiveRecord::Migration
  def change
    add_column :rental_records, :rate_daily, :money
  end
end
