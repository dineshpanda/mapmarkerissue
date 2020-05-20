class EmployeeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :emp_id, :integer
  attribute :emp_type, :string
  attribute :photo, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  # Indirect associations

end
