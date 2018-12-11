class SiteNotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :site_admin?, except: [:show]

  def new
    @site_notification = SiteNotification.new
  end

  def create
    @site_notification = current_user.site_notifications.build(create_params)
    @to_email = @site_notification.email_me
    @to_notify = @site_notification.to_notify

    if @site_notification.save
      # Post Notification
      (User.all).each do |user|
        if @to_notify
          Notification.create(recipient: user, actor: current_user, action: 'notification', notifiable: @site_notification)
        end
        if @to_email
          # test mailer
          # NotificationsMailer.site_notification_mailer('cgibsonmmdev@gmail.com', @site_notification.email_subject, @site_notification.title, @site_notification.body).deliver_later
          NotificationsMailer.site_notification_mailer(user, @site_notification.email_subject, @site_notification.title, @site_notification.body).deliver_later
        end
      end


      flash[:success] = 'Site notification posted'
      redirect_to '/forums'
    end
  end

  private

  def create_params
    params.require(:site_notification).permit(:user_id, :title, :body, :email_me, :email_subject, :to_notify)
  end

  def site_admin?
    unless current_user.has_role?(:admin)
      redirect_to '/forums'
    end
  end
end
