class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :users, through: :likes

  validates :text, presence: true
  validates :title, presence: true
end
