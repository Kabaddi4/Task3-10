class UsersController < ApplicationController

    before_action :ensure_correct_user, only:[:edit]
    def index
        @users = User.all
        @book = Book.new
    end

    def show
        @user = User.find(params[:id])
        #@user.オールを含んだローカル変数？　定義もしていないのに使えるとは思わな
        @books = @user.books
        #部分テンプレートで新規投稿を行いたい場合は必ず宣言する。
        @book = Book.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "You have updated user successfully"
            redirect_to user_path(@user.id)
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:profile_image, :name, :introduction)
    end

    def ensure_correct_user
    @user = User.find(params[:id])
        unless @user == current_user
        redirect_to user_path(current_user.id)
        end
    end
end