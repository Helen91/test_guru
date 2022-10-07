class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locael

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(user)
    if user.admin?
     admin_tests_path
    else
      root_url
    end
  end

  def default_url_options
    if I18n.default_locale == I18n.locale
      {}
    else 
      {lang: I18n.locale}
    end
  end

  private

  def set_locael
       I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
