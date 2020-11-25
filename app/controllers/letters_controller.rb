class LettersController < ApplicationController
  before_action :set_letters, only: [:edit, :update, :destroy]

  def index
    @letters = Letter.includes(:address, :user).order('created_at DESC')
  end

  def show
    @letters = Letter.includes(:address, :user).find(params[:id])
  end

  def edit
  end

  def update
    if @letter.update(letter_params)
      redirect_to posits_path
    else
      render :edit
    end
  end

  def destroy
    @letter.destroy
    redirect_to posits_path
  end

  private

  def letter_params
    params.require(:letter).permit(:thanks).merge(user_id: current_user.id)
  end

  def set_letters
    @letter = Letter.find(params[:id])
  end
end
