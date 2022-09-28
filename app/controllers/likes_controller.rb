class LikesController < ApplicationController
  def create
    @user = current_user
    @like = Like.new(params.permit(:author, :post))
    @post = Post.find(params[:post_id])
    @author = @post.author
    @like.post = @post
    @like.author = @user

    return unless @like.save

    redirect_to user_post_path(@author, @post)
  end
end
