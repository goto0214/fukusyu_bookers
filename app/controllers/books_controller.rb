class BooksController < ApplicationController

  def index
    @create = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @create = Book.new(book_params)
    if @create.save
      redirect_to books_path
      flash[:notice] = "投稿しました"
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "上書きしました"
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "削除しました"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
