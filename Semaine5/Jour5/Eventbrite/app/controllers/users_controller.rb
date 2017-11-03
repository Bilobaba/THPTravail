require 'pry'

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)

    if @user.save
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    session[:user] = @user.id
  end

  def index
    @users = User.all
  end

  def User.current
      return User.find(session[:user])
  end

  private
    def params_user
      params_user = params.require(:user).permit(:name)
    end


end
