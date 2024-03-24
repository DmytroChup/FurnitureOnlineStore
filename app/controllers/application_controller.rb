class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :show_footer

  private
  def show_footer
    if request.path.include?('/users/sign_in') ||
      request.path.include?('/users/sign_up') ||
      request.path.include?('/users/password')
      @show_footer = false
    else
      @show_footer = true
    end
  end

  protected
  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :first_name, :last_name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone, :first_name, :last_name, :username])
  end
end
