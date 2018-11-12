class NotificationsMailer < ApplicationMailer

  def notify_mailer(reciver, actor, action, post)
    @reciver = reciver
    @actor = actor.username
    @action = action
    @post = post

    mail(
      to: @reciver.email,
      subject: "New #{@action} on #{@post.forum_thread.subject}"
    )
  end
end
