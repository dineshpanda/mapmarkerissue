class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :employee_id
      t.string :office_addr

      t.timestamps
    end
  end
end
