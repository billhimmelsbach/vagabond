class CityPostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    @city = City.find(params[:city_id])
    post = Post.create(post_params)
    @city.posts.push(post)
    redirect_to city_path(@city)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
