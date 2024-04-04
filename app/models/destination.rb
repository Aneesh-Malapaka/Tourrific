class Destination < ApplicationRecord
  belongs_to :tour_company
  has_one_attached :main_image
  has_one :destination_detail, dependent: :destroy
  accepts_nested_attributes_for :tour_company
  accepts_nested_attributes_for :destination_details
  # converting the location into a Hash by serializing
  # serialize :location, type: Hash, coder: YAML
  # store :location, accessors: [:city,:state,:country,:country_code], coder: JSON, prefix: true
  # validates :dest_name, presence: true
  # validates :location_city, presence: true
  # validates :rating, presence: true
end
