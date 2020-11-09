class TopController < ApplicationController
  def index
    @posits = Posit.includes(:user).order('created_at DESC')
    @blogs = Blog.includes(:user).order('created_at DESC')
  end

  def show
    @letters = Letter.includes(:address, :user).order('created_at DESC')
  end
end
