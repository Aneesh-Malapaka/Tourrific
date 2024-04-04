class TourCompany < ApplicationRecord
  belongs_to :user
  has_many :destination,  dependent: :destroy 
  validates :company_name, presence: true
  validates :description, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
end
