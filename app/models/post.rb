class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  belongs_to :condominium
  has_many :comments, dependent: :destroy
end
