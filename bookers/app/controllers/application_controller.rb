class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!, {only: [:index, :edit, :show]}



  protected
    def after_sign_in_path_for(resource)
      user_path(resource)
    end

    #sign out後のredirect先変更
    def after_sign_out_path_for(resource)
      root_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) # ログイン時にnameを使用
    end



end
