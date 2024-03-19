class Rule < ApplicationRecord
  belongs_to :condominium
  has_many :photos
end
