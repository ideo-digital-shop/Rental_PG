class CreateRentalRecords < ActiveRecord::Migration
  def change
    create_table :rental_records do |t|
      t.string :email
      t.string :renter
      t.date :end
      t.integer :device_id
      t.integer :total_time

      t.timestamps
    end
  end
end
