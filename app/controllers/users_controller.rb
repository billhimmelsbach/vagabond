class UsersController < ApplicationController

  def splash
    @cities = City.all

    render :splash
  end

  def new
    @user = User.new
    render :new
  end

  def create
    # user = User.create(user_params)
        #
        # p user.errors.messages
        # render plain: User.create(user_params).errors.full_messages.inspect
        user = User.new(user_params)
        user = user.valid?
        if user.save
          flash[:notice] =  "yo"
          # flash[:notice] = "Sorry darling, but your desired email has already been claimed. Please choose a different one :P"
          redirect_to root_path
        else
          flash[:notice] = user.errors.full_messages
          redirect_to root_path
        end
      # if @user
        # @user =  User.create(user_params)
        #   login(@user)
        #   flash[:notice] = "Successfully signed up!"
        #   redirect_to root_path
      # else
      #   flash[:error] = @user.errors.full_messages
      # end
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user.id == current_user.id
      @posts = Post.where(user_id: params[:id])
      render :show
    else
      redirect_to user_path(current_user)
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city)
  end
end
