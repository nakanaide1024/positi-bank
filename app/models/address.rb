class Address < ApplicationRecord
  belongs_to :user
  belongs_to :letter
end
