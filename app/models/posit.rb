class Posit < ApplicationRecord
  belongs_to :user

  validates :posit, presence: true
end
