class NewUserNotifyMailer < ApplicationMailer
  default from: 'Donotreply@sproutfreecanada.com'

  def admin_mailer(user, admin)
    @count = User.all.count
    @user = user
    @admin = admin

    puts @count
      mail(
        to: @admin,
        subject: 'New user subcribed to site'
      )
  end
end
