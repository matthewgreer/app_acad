class UserMailer < ApplicationMailer
  default from: '99 Cats <overlord@ninetyninecats.com>'

  def welcome_email(user)
    @user = user
    @url = 'localhost:3000/cats'
    email_with_name = %("#{@user.username}" <#{@user.email}>)
    mail(to: email_with_name, subject: 'Welcome to 99 Cats! Rowr!')
  end

  
end
