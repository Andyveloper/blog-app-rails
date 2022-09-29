class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user, only: %i[create destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts

    respond_to do |format|
      format.json { render json: @posts }
      format.html { render json: @posts }
    end
  end
  
  private
  def authenticate_user
    
  end

end
