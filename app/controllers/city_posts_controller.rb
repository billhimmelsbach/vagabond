class CityPostsController < ApplicationController
  include SessionsHelper
  include AuthHelper

  def new
    @post = Post.new
    render :new
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

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

end
