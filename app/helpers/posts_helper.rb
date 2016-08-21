module PostsHelper
  def check_user
    current_user != nil && current_user.id = @post.user.id
  end

  def auth_fail
    flash[:error] = "You cannot edit other people's posts!"
    redirect_to post_path
  end
end
