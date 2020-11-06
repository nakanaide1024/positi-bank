class Blog < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :text, presence: true
  validates :title, presence: true
end
