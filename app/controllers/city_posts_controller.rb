class CityPostsController < ApplicationController
  include SessionsHelper
  include AuthHelper

  def new
    @post = Post.new
    render :new
  end

  def create
    @city = City.find(params[:city_id])
    post = Post.create(post_params)
    post.user_id = current_user.id
    @city.posts.push(post)
    flash[:success] = "Successfully posted in #{@city.name}"
    redirect_to city_path(@city)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

end
