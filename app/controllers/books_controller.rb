class BooksController < ApplicationController

  #books_path
  def index
    @books = Book.all
    @book = Book.new
  end

  #↑"
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  #book_path
  def show
    @book = Book.find[params[:id]]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  end
end
