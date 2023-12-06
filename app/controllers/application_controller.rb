class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000"}
  end
end
