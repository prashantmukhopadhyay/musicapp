class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])

    if @user.save
      render json: @user
    else
      render json: @user.erorrs.full_messages
    end
  end

  def new
    @user = User.new
  end

  def index
  end

end
