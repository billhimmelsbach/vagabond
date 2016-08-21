module ApplicationHelper
  def bootstrap_class_for flash_type
      { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

  # def authenticate_user_through_post
  #   current_user != nil && current_user.id == @post.user.id
  # end
  #
  # def authenticate_user_through_user
  #   current_user != nil && current_user.id == @user.id
  # end
  #
  # def authenticate_user_through_city
  #   current_user != nil && current_user.id == @city.user.id
  # end

  def auth_fail
    flash[:error] = "You cannot edit other people's posts!"
    redirect_to post_path
  end
end
