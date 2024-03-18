class Resident < ApplicationRecord
  belongs_to :condominium
  belongs_to :user

  enum role: {
    syndic: 0,
    resident: 1,
    subsyndic: 2
  }

  validates :residence_number, presence: true
  validates :role, presence: true
end
