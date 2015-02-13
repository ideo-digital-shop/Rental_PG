class AddTotalPriceToRentalRecord < ActiveRecord::Migration
  def change
    add_column :rental_records, :total_price, :money
  end
end
