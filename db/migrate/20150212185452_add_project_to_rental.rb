class AddProjectToRental < ActiveRecord::Migration
  def change
    add_column :rentals, :project, :string
  end
end
