class AddRenterToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :renter, :string
  end
end
