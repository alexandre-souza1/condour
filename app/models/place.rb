class Place < ApplicationRecord
  has_many_attached :photos
  belongs_to :condominium

  validates :photos, presence: true
end
