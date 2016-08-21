class PostsController < ApplicationController
  include ApplicationHelper

  def index
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    if authenticate_user_through_post
      render :edit
    else
      auth_fail
    end
  end

  def update
    @post = Post.find(params[:post_id])
    if authenticate_user_through_post
      if @post.update(post_params)
        redirect_to post_path
      else
        render :edit
      end
    else
      auth_fail
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if authenticate_user_through_post
      @city = City.find(params[:city_id])
      @post.destroy
      redirect_to city_path(@city)
    else
      auth_fail
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
