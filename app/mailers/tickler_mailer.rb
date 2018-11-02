class TicklerMailer < ApplicationMailer

  def tickler_email(user)
    @user = user

    mail(
      to: "#{@user}",
      subject: 'Sprout Free Growing Our Community!'
    )
  end

  def admin_mailer(admin, user)
    @admin = admin
    @user = user

    mail(
      to: @admin,
      subject: 'New user subcribed for updates'
    )
  end
end
