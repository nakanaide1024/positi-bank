class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :edit]
  before_action :set_blog, only: [:index, :destroy, :edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to controller: :posits, action: :index
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

  def move_to_index
    @blog = Blog.find(params[:id])
    redirect_to root_path unless current_user.id == @blog.user.id
  end 
end
