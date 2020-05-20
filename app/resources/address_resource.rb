class AddressResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :employee_id, :integer
  attribute :office_addr, :string

  # Direct associations

  # Indirect associations

end
