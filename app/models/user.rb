class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posits
  has_many :blogs

  validates :nickname, presence: true, uniqueness: { case_sensitive: true },
                       length: { minimum: 3, maximum: 50 }
  validates :password, format: { with: /\A[a-z0-9]+\z/i },
                       confirmation: true
end
