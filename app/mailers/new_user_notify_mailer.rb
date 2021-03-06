class NewUserNotifyMailer < ApplicationMailer
  default from: 'Donotreply@sproutfreecanada.ca'

  def admin_mailer(user, admin)
    @count = User.all.count
    @user = user
    @admin = admin

      mail(
        to: @admin,
        subject: 'New user subcribed to site'
      )
  end
end
