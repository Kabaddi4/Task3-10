class ApplicationController < ActionController::Base
  #ログインユーザーにのみ許可するアクションを指定しているので、 exceptメソッドでしっかり指定しておく。
  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected
   #sign_up時に、nameカラムの操作を許可するメソッド　↓ここがおかしいかも11/7　課題：サインアップの際にintroductionまで要求されてしまう
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

end