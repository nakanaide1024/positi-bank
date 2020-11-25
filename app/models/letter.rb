class Letter < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy

  validates :thanks, presence: true
end
