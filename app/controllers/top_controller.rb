class TopController < ApplicationController
  def index
    @posits = Posit.includes(:user).order('created_at DESC')
    @blogs = Blog.includes(:user).order('created_at DESC')
    

    if user_signed_in?
      likes = Like.includes([:user, :posit])
      blog_likes = BlogsLike.includes([:user, :blog])
      letters = Letter.includes(:address, :user)
      posit = Posit.includes(:user)
      liked_posit_id = posit.where(user_id: current_user.id)
      blog = Blog.includes(:user)
      liked_blog_id = blog.where(user_id: current_user.id)
      @blog = blog_likes.where(user_id: current_user.id).count
      @like = likes.where(user_id: current_user.id).count
      @liked_posit = likes.where(posit_id: liked_posit_id).count
      @liked_blog =  blog_likes.where(blog_id: liked_blog_id).count
      @letters = letters.where(user_id: current_user.id).count
      @address = Address.where(user_id: current_user.id).count
      @result = @blog + @like + ( @letters * 100 ) + ( @address * 1000 ) + @liked_posit + @liked_blog
    end
  end

  def show
    @letters = Letter.includes(:address, :user).order('created_at DESC')
  end
end
