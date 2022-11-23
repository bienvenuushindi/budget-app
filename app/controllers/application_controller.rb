class ApplicationController < ActionController::Base
  #
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    welcome_path
  end

  def after_sign_in_path_for(_resource_or_scope)
    categories_path
  end
end
