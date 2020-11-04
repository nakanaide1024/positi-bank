class BlogsController < ApplicationController
  
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      ridirect_to controller: :posits, action: :index
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text).merge(user_id: current_user.id)
  end
end
