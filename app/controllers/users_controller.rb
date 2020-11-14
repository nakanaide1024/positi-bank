class UsersController < ApplicationController
  before_action :move_to_index, only: [:show]

  def show
    @posits = @user.posits
    @blogs = @user.blogs
    likes = Like.includes([:user, :posit])
    if user_signed_in?
    @like = likes.where(user_id: current_user.id).count
    end
  end

  private

  def move_to_index
    @user = User.find(params[:id])
    if user_signed_in? && @user.id == current_user.id
      redirect_to posits_path
    end
  end
end
