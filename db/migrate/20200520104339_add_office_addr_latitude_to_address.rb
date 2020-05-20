class AddOfficeAddrLatitudeToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :office_addr_latitude, :float
  end
end
