class ApplicationController < ActionController::Base
  #ログインユーザーにのみ許可するアクションを指定しているので、 exceptメソッドでしっかり指定しておく。
  before_action :authenticate_user!,except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後の画面遷移先の設定
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  protected
   #deviseの処理で使う値を設定するメソッド（この場合sign_upに nameとemailを許可する）　↓ここがおかしいかも11/7　課題：サインアップの際にintroductionまで要求されてしまう|追記：→Userモデルにて、不必要なバリデーションを実装してしまっていた。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end