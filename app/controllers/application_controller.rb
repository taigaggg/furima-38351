class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! , only:[:new]
  # ログイン画面へ誘導

  def after_sign_in_path_for(resource)
    root_path 
    # ログイン後に遷移するpathを設定した
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name_full, :first_name_full, :last_name_kana, :first_name_kana, :birthday])
  end
end
