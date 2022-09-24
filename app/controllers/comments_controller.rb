class CommentsController < ApplicationController
  def new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create; end
end
