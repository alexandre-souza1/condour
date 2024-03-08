class Condominium < ApplicationRecord
  has_many :users
  has_many :posts
  has_many :services

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [:name],
  using: {
    tsearch: { prefix: true }
  }
end
