class LettersController < ApplicationController

  def index
    @letters = Letter.includes(:address, :user).order('created_at DESC')
  end

  def show
    @letters = Letter.includes(:address, :user).find(params[:id])
  end

  def edit
    @letter = Letter.find(params[:id])
  end

  def update
    letter = Letter.find(params[:id])
    letter.update(letter_params)
    redirect_to posits_path
  end

  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy
    redirect_to posits_path
  end

  private

  def letter_params
    params.require(:letter).permit(:thanks).merge(user_id: current_user.id)
  end
end
