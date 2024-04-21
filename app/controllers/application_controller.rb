class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :show_footer

  around_action :switch_locale

  private
  def show_footer
    if request.path.include?('/users/sign_in') ||
      request.path.include?('/users/sign_up') ||
      request.path.include?('/users/password') ||
      request.path.include?('/producers/sign_in') ||
      request.path.include?('/producers/password') ||
      request.path.include?('/producers/sign_up') ||
      request.path.include?("/users/confirmation") ||
      request.path.include?("/producers/confirmation")
      @show_footer = false
    else
      @show_footer = true
    end
  end

  def switch_locale(&action)
    locale = locale_from_url || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s).include?(locale)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  protected
  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :first_name, :last_name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone, :first_name, :last_name, :username])
  end
end
