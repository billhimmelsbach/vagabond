class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    render :edit
  end

  def update
    @post = Post.find(params[:post_id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:city_id])
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to city_path(@city)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
