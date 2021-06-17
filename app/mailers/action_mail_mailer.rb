class ActionMailMailer < ApplicationMailer

def send_email(user)
  @user = user
     email_with_name = "#{@user.name} <#{@user.email}>"
     mail(to: email_with_name,from:"" + @user.email ,
      subject: 'Confirmación de cuenta, BabySitter. ')
  end

end
