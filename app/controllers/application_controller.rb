class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected
  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :first_name, :last_name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone, :first_name, :last_name, :username])
  end
end
