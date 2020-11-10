class Posit < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes

  validates :posit, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
