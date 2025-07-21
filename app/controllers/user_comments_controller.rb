class UserCommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments
    render json: @comments
  end
end 
