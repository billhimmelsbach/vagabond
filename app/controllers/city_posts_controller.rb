class CityPostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    @city = City.find(params[:city_id])
    @post = Post.new(post_params)
    if @post.save
    @city.posts.push(@post)
    flash[:success] = "Successfully posted in #{@city.name}"
    redirect_to city_path(@city)
    else
      flash[:notice] = @post.errors.full_messages
      redirect_to new_city_post_path(@city)
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
