class PostsController < ApplicationController
  include AuthHelper

  def show
    @post = Post.find(params[:post_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    if auth_through_post
      render :edit
    else
      auth_fail("edit other people's posts!", post_path)
    end
  end

  def update
    @post = Post.find(params[:post_id])
    if auth_through_post
      if @post.update(post_params)
        redirect_to post_path
      else
        render :edit
      end
    else
      auth_fail("update other people's posts!", post_path)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if auth_through_post
      @city = City.find(params[:city_id])
      @post.destroy
      flash[:success] = "Your post titled \"#{@post.title}\" was successfully deleted from the #{@city.name} city page"
      redirect_to city_path(@city)
    else
      auth_fail("delete other people's posts", post_path)
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
    
end
