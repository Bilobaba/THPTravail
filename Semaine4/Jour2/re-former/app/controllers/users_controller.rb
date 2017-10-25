require 'pry'

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    pp = params
binding.pry
    u = User.create(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    u = User.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :bio)
  end

end
