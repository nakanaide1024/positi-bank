class TopController < ApplicationController

  def index
    @posits = Posit.includes(:user).order('created_at DESC')
  end
end
