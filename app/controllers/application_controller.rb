class ApplicationController < ActionController::Base
  #↓未ログイン時、ログイン画面に遷移
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #↓ログイン後の遷移先
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  #↓ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthdate, :phone_number])
  end
end
