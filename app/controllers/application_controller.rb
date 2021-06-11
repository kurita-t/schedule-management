class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show]

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :password, :password_confirmation, :nickname, :family_name, :first_name,:family_name_kana, :first_name_kana, :birth_day ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
