class BooksController < ApplicationController

  def index
    @create = Book.new
    @books = Book.all
  end

  def show
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
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
