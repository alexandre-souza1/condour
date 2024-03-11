class Condominium < ApplicationRecord
  has_many_attached :photos
  has_many :users
  has_many :posts
  has_many :services
  has_many :places

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [:name],
  using: {
    tsearch: { prefix: true }
  }
end
