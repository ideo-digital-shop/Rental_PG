class AddCommentToRentalRecords < ActiveRecord::Migration
  def change
    add_column :rental_records, :comment, :string
  end
end
