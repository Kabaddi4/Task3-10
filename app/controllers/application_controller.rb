class ApplicationController < ActionController::Base
  #ログインユーザーにのみ許可するアクションを指定しているので、 exceptメソッドでしっかり指定しておく。
  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected
   #sign_up時に、nameカラムの操作を許可するメソッド
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end

end