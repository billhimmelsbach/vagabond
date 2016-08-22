class UsersController < ApplicationController
  include AuthHelper

  def splash # in other words, "index"
    @cities = City.all
    render :splash
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image_url = "http://i.imgur.com/ixpF82Y.png" if @user.image_url == ""

    if @user.save
      login(@user)
      flash[:notice] = "Congratulations, you have been signed up! A registration e-mail has been delivered to your email address. We hope you enjoy the site!"
      redirect_to @user
      return # return early! We're done!
    end

    flash[:notice] = "Sorry darling, but there are issues with your attempted signup. Issues are as follows. #{@user.errors.full_messages.join(', ')}. So basically, umm, yeah, try again :P"
    redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    # @user = User.friendly.find(params[:id].to_s.downcase)
    @posts = @user.posts
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
    if @user.image_url == ""
      @user.image_url = "http://i.imgur.com/ixpF82Y.png"
    end
    if auth_through_user
      if @user.update(user_params)
        flash[:success] = "Your profile was successfully updated"
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :image_url)
  end

end
