class Place < ApplicationRecord
  has_many_attached :photos
  belongs_to :condominium

  validates :photos, presence: true
  validates :name, presence: true
  validates :residence_number, presence: true
  validates :contact, presence: true
end
