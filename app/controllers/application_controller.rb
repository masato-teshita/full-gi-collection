class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :redirect_to_root, only: [:render_404]
  before_action :store_current_location, unless: :devise_controller?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_host
  before_action :set_shop_search_query

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

  def set_shop_search_query
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
  end

  def admin_check(shop)
    redirect_to root_path unless current_user.admin? || shop.shop_admin == current_user
  end

  def redirect_to_root
    redirect_to root_path
  end

  private
  def store_current_location
    store_location_for(:user, request.url)
  end
end
