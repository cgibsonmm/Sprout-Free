class NotificationsMailer < ApplicationMailer
  def notify_mailer(reciver, actor, action, post)
    @reciver = reciver
    @actor = actor.username
    @action = action
    @post = post

    mail(
      to: @reciver.email,
      subject: "Hey, #{@actor} just #{@action} on #{@post.forum_thread.subject}"
    )
  end

  def site_notification_mailer(user, subject, title, body)
    @reciver = user
    @subject = subject
    @title = title
    @body = body

    mail(
      to: @reciver,
      subject: @subject
    )
  end
end
