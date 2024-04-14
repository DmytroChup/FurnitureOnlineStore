# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :show_footer

  private

  def show_footer
    excluded_paths = [
      "/users/sign_in",
      "/users/sign_up",
      "/users/password",
      "/producers/sign_in",
      "/producers/password",
      "/producers/sign_up",
      "/users/confirmation",
      "/producers/confirmation"
    ]

    @show_footer = excluded_paths.none? {|path| request.path.include?(path) }
  end

  protected

  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone first_name last_name username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[phone first_name last_name username])
  end
end
