class User < ApplicationRecord
  has_many :residents
  has_many :rentals
  has_many :services
  has_many :condominia, through: :residents
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :photo, presence: true
end
