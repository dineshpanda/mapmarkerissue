class AddOfficeAddrFormattedAddressToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :office_addr_formatted_address, :string
  end
end
