class Posit < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes

  validates :posit, presence: true

end
