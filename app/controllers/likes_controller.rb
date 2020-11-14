class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
      user = current_user
      posit = Posit.find(params[:posit_id])
      like = Like.create(user_id: user.id, posit_id: posit.id)
      item = Posit.find(params[:posit_id])
      render json:{ posit: item }
  end
  def destroy
      user = current_user
      posit = Posit.find(params[:posit_id])
      like = Like.find_by(user_id: user.id, posit_id: posit.id)
      like.delete
  end
  def checked
    posit = Posit.find(params[:posit_id])
    if posit.checked
      posit.update(checked: false)
    else
      posit.update(checked: true)
    end
    item = Posit.find(params[:posit_id])
    render json:{ posit: item }
  end
  def confirmation
    likes = Like.includes([:user, :posit])
    posit = Posit.find(params[:posit_id])
    @like = likes.where(posit_id: posit.id)
    if @like.where(user_id: current_user.id).blank?
      posit.update(checked: false)
      item = Posit.find(params[:posit_id])
      render json:{ posit: item }
    else
      posit.update(checked: true)
      item = Posit.find(params[:posit_id])
      render json:{ posit: item }
    end
  end
end
