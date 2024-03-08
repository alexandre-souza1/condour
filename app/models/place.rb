class Place < ApplicationRecord
  has_many_attached :photos
  belongs_to :condominium
end
