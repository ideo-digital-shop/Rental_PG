class AddAdditionalInformationToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :additional_information, :string
  end
end
