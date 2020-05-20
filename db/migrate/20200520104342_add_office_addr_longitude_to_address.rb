class AddOfficeAddrLongitudeToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :office_addr_longitude, :float
  end
end
