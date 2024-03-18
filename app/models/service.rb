class Service < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :identification, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
