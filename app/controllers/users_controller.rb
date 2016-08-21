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

        @user = User.new(user_params)

        if @user.save
          login(@user)
          flash[:notice] = "Congratulations, you have been signed up! A registration e-mail has been delivered to your email address. We hope you enjoy the site!"
          redirect_to @user
        else

        flash[:notice] = "Sorry darling, but there are issues with your attempted signup. #{@user.errors.full_messages.join(', ')}. Try again :P"
        redirect_to new_user_path
        end

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
