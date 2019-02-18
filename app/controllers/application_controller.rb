class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :error

  before_action :detect_device_variant
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_notifications, if: :user_signed_in?
  before_action :set_categories
  before_action :top_thread

  def set_notifications
    @notifications = Notification.where(recipient: current_user).recent
  end

  # def prior_to_launch
  #   redirect_to root_path unless user_signed_in? && current_user.hase_role?(:admin)
  # end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

  def set_categories
    @all_categories = ForumCategory.all
  end

  def top_thread
    @top_thread = ForumThread.all.max_by {|thread| thread.forum_posts.count }
  end

 def detect_device_variant
   request.variant = :phone if browser.device.mobile?
 end
end
