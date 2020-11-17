class ProfilesController < ApplicationController
  before_action :profile_params, only: [:create]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to posits_path
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to posits_path
  end

  private
  def profile_params
    params.require(:profile).permit(:profile).merge(user_id: current_user.id)
  end
end
