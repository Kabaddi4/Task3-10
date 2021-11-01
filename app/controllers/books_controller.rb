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
    if @book.save
      redirect_to book_path
    else
      redirect_to books_path
    end
  end

  #book_path
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
  params.require(:book).permit(:title, :body, :book_image)
  end
end
