class BlogsLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    user = current_user
    blog = Blog.find(params[:blog_id])
    like = BlogsLike.create(user_id: user.id, blog_id: blog.id)
    item = Blog.find(params[:blog_id])
    render json: { blog: item }
  end

  def destroy
    user = current_user
    blog = Blog.find(params[:blog_id])
    like = BlogsLike.find_by(user_id: user.id, blog_id: blog.id)
    like.delete
  end

  def checked
    blog = Blog.find(params[:blog_id])
    if blog.checked
      blog.update(checked: false)
    else
      blog.update(checked: true)
    end
    item = Blog.find(params[:blog_id])
    render json: { blog: item }
  end

  def confirmation
    likes = BlogsLike.includes([:user, :blog])
    blog = Blog.find(params[:blog_id])
    @like = likes.where(blog_id: blog.id)
    if @like.where(user_id: current_user.id).blank?
      blog.update(checked: false)
      item = Blog.find(params[:blog_id])
      render json: { blog: item }
    else
      blog.update(checked: true)
      item = Blog.find(params[:blog_id])
      render json: { blog: item }
    end
  end
end
