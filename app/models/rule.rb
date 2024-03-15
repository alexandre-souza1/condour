class Rule < ApplicationRecord
  has_many_attached :files
  belongs_to :condominium

  validates :title, presence: true
end
