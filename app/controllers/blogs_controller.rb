class BlogsController < ApplicationController
  before_action :set_blog, only: [:index, :destroy, :edit, :update]

  def index
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

  def show
    @blogs = current_user.blogs
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    redirect_to root_path
  end

  def destroy
    @blog.destroy
    redirect_to root_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
