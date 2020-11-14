class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posits
  has_many :blogs
  has_many :addresses
  has_many :letters
  has_many :likes
  has_many :posits, through: :likes
  has_many :blogs, through: :likes

  validates :nickname, presence: true, uniqueness: { case_sensitive: true },
                       length: { minimum: 3, maximum: 10 }
  validates :password, format: { with: /\A[a-z0-9]+\z/i },
                       confirmation: true
end