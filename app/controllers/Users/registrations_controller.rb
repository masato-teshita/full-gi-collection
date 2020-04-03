# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
    # redirect_to root_path
    # configure_permitted_parameters
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    render template: 'users/update'
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # def user_params
  #   add_attrs = [ :email, :name, :password, :password_confirmation, :image, :inctoduction, :cover_image ]
  #   devise_parameter_sanitizer.permit :sign_up, keys: add_attrs
  #   devise_parameter_sanitizer.permit :account_update, keys: add_attrs
  #   devise_parameter_sanitizer.permit :sign_in, keys: add_attrs
  # end
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   add_attrs = [ :email, :name, :password, :password_confirmation, :image, :inctoduction, :cover_image ]
  #   devise_parameter_sanitizer.permit :sign_up, keys: add_attrs
  #   devise_parameter_sanitizer.permit :account_update, keys: add_attrs
  #   devise_parameter_sanitizer.permit :sign_in, keys: add_attrs
  #   # render template: 'users/update'
  # end

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit!
  #   # devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  #   render template: 'users/update'
  # end

  # # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   redirect_to user_path(current_user)
  # end

  # # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   redirect_to user_path(current_user)
  # end
end
