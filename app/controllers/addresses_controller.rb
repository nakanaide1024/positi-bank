class AddressesController < ApplicationController

  def new
    @letter_address = LetterAddress.new
  end

  def create
    @letter_address = LetterAddress.new(letter_params)
    if @letter_address.valid?
       @letter_address.save
       redirect_to posits_path
    else
      render :new
    end
  end

  private
  def letter_params
    params.require(:letter_address).permit(:thanks).merge(send_id: current_user.id, address_id: params[:user_id])
  end

end
