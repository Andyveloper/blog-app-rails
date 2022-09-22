class PostsController < ApplicationController
  def index
    @users = User.find(params[:id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
