class UserMailer < ActionMailer::Base
    default :from => "me@trabajoo.herokuapp.com"
  ADD EMAIL ADDRESS

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
 end
end
