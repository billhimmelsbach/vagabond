class CityPostsController < ApplicationController
  include SessionsHelper
  include AuthHelper

  def new
    @post = Post.new
    render :new
  end

  def create
    if logged_in?
      @city = City.find(params[:city_id])
      post = Post.create(post_params)
      @city.posts.push(post)
      flash[:success] = "Successfully posted in #{@city.name}"
      redirect_to city_path(@city)
    else
      auth_fail("make a new post unless you're logged in!", @city)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
