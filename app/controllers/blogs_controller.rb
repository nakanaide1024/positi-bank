class BlogsController < ApplicationController
  
  def index
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to  controller: :posits, action: :index
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
