class LetterAddress
  include ActiveModel::Model
  attr_accessor :thanks, :send_id, :address_id

  validates :thanks, presence: true

  def save
    @address = Letter.create(user_id: send_id, thanks: thanks)
    Address.create(user_id: address_id, letter_id: @address.id)
  end
    
end