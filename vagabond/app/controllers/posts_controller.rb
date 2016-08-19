class PostsController < ApplicationController
  def index
  end



  def new
    @post = Post.new
    render :new
  end

  def create
    post_params = params.require(:post).permit(:title, :content, :image)
    @post = Post.create(post_params)
    redirect_to post_path
  end

  def show
    @post = Post.find(params[:id])
  end
end
