class UsersController < ApplicationController
  include AuthHelper

  def splash
    @cities = City.all

    render :splash
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = Post.where(user_id: params[:id])
    render :show
  end

  def edit
    @user = User.find_by_id(params[:id])
    if !auth_through_user
      auth_fail("edit other people's user information!", @user)
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if auth_through_user
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
    else
      auth_fail("update other people's user information!", @user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city)
  end
end
