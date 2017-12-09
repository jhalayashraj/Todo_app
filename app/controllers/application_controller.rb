class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :ensure_layout

  def after_sign_out_path_for(resource_or_scope)
    new_session_path(resource_name)
  end

  def ensure_layout
    current_user.present? ? 'application' : 'login'
  end
end
