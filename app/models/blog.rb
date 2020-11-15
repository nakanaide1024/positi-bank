class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :liked_users, through: :blog_likes, source: :user

  validates :text, presence: true
  validates :title, presence: true
end
