class LettersController < ApplicationController

  def index
    @letters = Letter.includes(:address, :user).order('created_at DESC')
  end

  def show
    @letters = Letter.includes(:address, :user).find(params[:id])
  end
end
