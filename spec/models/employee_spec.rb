require 'rails_helper'

RSpec.describe Employee, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:addresses) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
