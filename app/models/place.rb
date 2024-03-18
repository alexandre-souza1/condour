class Place < ApplicationRecord
  has_many_attached :photos
  belongs_to :condominium

  validates :photos, presence: true

  #if Place.apartment
  validates :photos, presence: true, if: :apartment?
  validates :residence_number, presence: true, if: :apartment?
  validates :contact, presence: true, if: :apartment?

  validate :at_least_one_price_present, if: :apartment?

  #end

  private

  def at_least_one_price_present
    unless rent_price.present? || sale_price.present?
      errors.add(:base, "At least one of rent price or sale price must be present")
    end
  end

  def apartment?
    apartment
  end
end
