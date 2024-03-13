class User < ApplicationRecord
  belongs_to :condominium, optional: true
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    syndic: 0,
    resident: 1,
    subsyndic: 2
  }
end
