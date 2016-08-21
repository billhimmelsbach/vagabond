module AuthenticationHelper
  def authenticate_user_through_post
    current_user != nil && current_user.id = @post.user.id
  end

  def authenticate_user_through_user
    current_user != nil && current_user.id = @user.id
  end

  def authenticate_user_through_city
    current_user != nil && current_user.id = @city.user.id
  end

  def auth_fail
    flash[:error] = "You cannot edit other people's posts!"
    redirect_to post_path
  end
end
