class PostsController < ApplicationController
  include AuthHelper

  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
  end

  def create
    @city = City.find(params[:city_id])
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      @city.posts.push(@post)
      flash[:success] = "Awesome! Your post titled \"#{@post.title}\" was successfully submitted to the #{@city.name} city page"
      redirect_to "/cities/#{@city.id}"
    else
      flash[:notice] = "Sorry bud, but we can't accept your post. And this is why. #{@post.errors.full_messages.join(', ')}. No big deal. Just try a new post, keeping this in mind. ;)"
      redirect_to "/cities/#{@city.id}/posts/new"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "#{@post.title} successfully updated"
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:city_id])
    @post.destroy
    flash[:success] = "Your post titled \"#{@post.title}\" was successfully deleted from the #{@city.name} city page"
    redirect_to city_path(@city)
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :image)
    end

    def authorize_user!
      auth_fail("Not authorized to perform this action", post_path) unless auth_through_post
    end

end
