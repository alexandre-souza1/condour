class Condominium < ApplicationRecord
  has_many_attached :photos
  has_many :residents
  has_many :users, through: :residents
  has_many :posts
  has_many :services
  has_many :places
  has_many :rules
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [:name],
  using: {
    tsearch: { prefix: true }
  }
end
