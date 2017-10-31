require 'pry'

class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @title = "New user bee"
    @user = User.new
  end

  def create
    @user = User.create(params_user)
    redirect_to users_path
  end

  def update
    @user = User.update(params_user)
  end

  def edit
  end

  def destroy
    @user.destroy
  end

  def delete
  end

  private
    def params_user
      params.require(:user).permit(:pseudo,:email,:password,:password_confirmation)
    end

    def get_user
      @user = User.find(params[:id])
    end
end

