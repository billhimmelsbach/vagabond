module AuthHelper
  def auth_through_post
    current_user != nil && current_user.id == @post.user.id
  end

  def auth_through_user
    current_user != nil && current_user.id == @user.id
  end

  def auth_through_city
    current_user != nil && current_user.id == @city.user.id
  end

  def auth_fail(reason_for_failure, redirect_path)
    flash[:error] = "You can't " + reason_for_failure
    redirect_to redirect_path
  end
end
