class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :email
      t.date :end
      t.integer :device_id

      t.timestamps
    end
  end
end
