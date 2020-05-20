require 'open-uri'
class Address < ApplicationRecord
  before_validation :geocode_office_addr

  def geocode_office_addr
    if self.office_addr.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.office_addr)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.office_addr_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.office_addr_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.office_addr_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :employee

  # Indirect associations

  # Validations

  # Scopes

end
