class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :ensure_layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    new_session_path(resource_name)
  end

  def ensure_layout
    current_user.present? ? 'application' : 'login'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :avatar) }
  end
end
