class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/session/new'
    mail(to: 'email@email.com', subject: "Welcome to our site!")
  end

end
