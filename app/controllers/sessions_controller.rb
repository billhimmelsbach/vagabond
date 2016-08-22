class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create

    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:success] = "Successfully logged in."
      redirect_to @user
    else
      flash[:error] = "Incorrect email or password."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end

  def forgot

  end

  def handleforgot
    @email = User.new(user_params).email
    @user = User.find_by(email: @email.to_s.downcase)


      if @user
      random_password = Array.new(8).map {(65 + rand(58)).chr}.join
      @user.password = random_password
      @user.save!
      Mailer.reset_password(@email, random_password).deliver_now
      flash[:notice] = "Do not fear, #{@user.first_name}! A reset password email has been sent to #{@email}"
      redirect_to root_path
      else
        flash[:notice] = "Nice try, kid, but a user with that email address does not exist. Just sign up below."
        redirect_to new_user_path

      end

  end

private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
