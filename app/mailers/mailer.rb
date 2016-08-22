class Mailer < ApplicationMailer
  default from: 'suppstream@gmail.com'

  def welcome_email(user)

    @user = user
    @url = "https://yourvagabond.herokuapp.com"
    email_with_name = %("#{@user.first_name}" <#{@user.email}>)
    mail(to: email_with_name, subject: "Welcome to Vagabond, #{@user.first_name}")

  end

  def reset_password(email, random_password)
    @email = email
    @random_password = random_password
    @user = User.find_by(email: "#{@email}")
    @first_name = @user.first_name
    @url = "https://yourvagabond.herokuapp.com/login"

    mail(to: @email, subject: "Reset password request for #{@first_name}")

  end

end
