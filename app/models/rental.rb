class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :date, presence: true
  validates :time, presence: true
end
