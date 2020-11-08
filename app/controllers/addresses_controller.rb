class AddressesController < ApplicationController

  def new
    @letter_address
  end

  def create
    @letter_address = LetterAddress.new()
  end

  
end
