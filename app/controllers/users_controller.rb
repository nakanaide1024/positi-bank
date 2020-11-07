class UsersController < ApplicationController
  before_action :move_to_index, only: [:show]

  def show
    @posits = @user.posits
    @blogs = @user.blogs
  end

  private

  def move_to_index
    @user = User.find(params[:id])
    if @user.id == current_user.id
      redirect_to posits_path
    end
  end
end
