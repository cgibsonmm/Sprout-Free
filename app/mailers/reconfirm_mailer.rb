class ReconfirmMailer < ApplicationMailer

  def confirm_mailer(user)
    @user = user

    mail(
      to: @user.email,
      subject: "WE ARE SORRY - There was an issue with our email confirmation system!"
    )
  end
end
