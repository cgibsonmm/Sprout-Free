class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :admin?

  # def prior_to_launch
  #   redirect_to root_path unless user_signed_in? && current_user.hase_role?(:admin)
  # end

protected

def admin?
  if user_signed_in? && current_user.has_role?(:admin)
    gon.admin = true
  else
    gon.admin = false
  end
end

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
end
end
