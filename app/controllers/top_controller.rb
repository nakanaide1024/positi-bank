class TopController < ApplicationController
  def index
    @posits = Posit.includes(:user).order('created_at DESC')
    @blogs = Blog.includes(:user).order('created_at DESC')
    likes = Like.includes([:user, :posit])
    if user_signed_in?
    @like = likes.where(user_id: current_user.id).count
    end
  end

  def show
    @letters = Letter.includes(:address, :user).order('created_at DESC')
  end
end
