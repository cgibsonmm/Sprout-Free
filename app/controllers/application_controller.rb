class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :admin?

protected

def admin?
  if user_signed_in? && current_user
    gon.admin = true
  else
    gon.admin = false
  end
end

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
end
end
