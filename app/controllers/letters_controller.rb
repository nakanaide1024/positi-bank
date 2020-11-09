class LettersController < ApplicationController

  def index
    @letters = Letter.includes(:address, :user).order('created_at DESC')
  end
end
