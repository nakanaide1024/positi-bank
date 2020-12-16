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
  has_many :profiles
  has_many :blogs_likes
  has_many :liked_posit, through: :likes, source: :posit
  has_many :liked_blog, through: :blogs_likes, source: :blog

  validates :nickname, presence: true, uniqueness: { case_sensitive: true },
                       length: { minimum: 3, maximum: 10 }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, length: { minimum: 6 },
                       format: { with: VALID_PASSWORD_REGEX },
                       confirmation: true

  def self.guest
    find_or_create_by!(email: 'test@com') do |user|
      user.password = '111aaa'
    end
  end
end
