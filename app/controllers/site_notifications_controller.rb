class SiteNotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :site_admin?, except: [:show]

  def new
    @site_notification = SiteNotification.new
  end

  def create
    @site_notification = current_user.site_notifications.build(create_params)

    if @site_notification.save

      # Post Notification
      (User.all).each do |user|
        Notification.create(recipient: user, actor: current_user, action: 'notification', notifiable: @site_notification)
      end

      flash[:success] = 'Site notification posted'
      redirect_to '/forums'
    end
  end

  private

  def create_params
    params.require(:site_notification).permit(:user_id, :title, :body)
  end

  def site_admin?
    unless current_user.has_role?(:admin)
      redirect_to '/forums'
    end
  end
end
