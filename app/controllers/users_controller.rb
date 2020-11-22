class UsersController < ApplicationController
  before_action :move_to_index, only: [:show]

  def show
    @posits = @user.posits
    @blogs = @user.blogs
    @profile = @user.profiles
  end

  private

  def move_to_index
    @user = User.find(params[:id])
    redirect_to posits_path if user_signed_in? && @user.id == current_user.id
  end
end
