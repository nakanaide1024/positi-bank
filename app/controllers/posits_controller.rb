class PositsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
    @posits = Posit.includes(:user).order('created_at DESC')
  end

  def new
    @posit = Posit.new
  end

  def create
    @posit = Posit.new(posit_params)
    if @posit.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    posit = Posit.find(params[:id])
    posit.destroy
    redirect_to root_path
  end
  private

  def posit_params
    params.require(:posit).permit(:posit).merge(user_id: current_user.id)
  end
end
