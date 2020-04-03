class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_host

  def set_host
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end
  protected

  def configure_permitted_parameters
    add_attrs = [ :email, :name, :password, :password_confirmation, :image, :inctoduction, :cover_image ]
    devise_parameter_sanitizer.permit :sign_up, keys: add_attrs
    devise_parameter_sanitizer.permit :account_update, keys: add_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: add_attrs
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || mypage_root_path
  end

  private
  def store_current_location
    store_location_for(:user, request.url)
  end
end
