class AddCommentToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :comment, :string
  end
end
