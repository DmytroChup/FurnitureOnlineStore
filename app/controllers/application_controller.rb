# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :show_footer

  around_action :switch_locale

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

  def switch_locale(&)
    locale = locale_from_url || I18n.default_locale
    I18n.with_locale(locale, &)
  end

  def locale_from_url
    locale = params[:locale]

    locale if I18n.available_locales.map(&:to_s).include?(locale)
  end

  def default_url_options
    {locale: I18n.locale}
  end

  protected

  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone first_name last_name username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[phone first_name last_name username])
  end
end
