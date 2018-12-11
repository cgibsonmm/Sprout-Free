class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :detect_device_variant
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_admin

  before_action :set_notifications, if: :user_signed_in?

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

  def check_admin
    gon.admin = (true if user_signed_in? && current_user.has_role?(:admin))
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

 def detect_device_variant
   request.variant = :phone if browser.device.mobile?
 end
end
