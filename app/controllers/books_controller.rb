class BooksController < ApplicationController

  def index
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @book_d = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update
    redirect_to books_show_path(@book.id)
  end

  def destroy
  end

  def create
    @book = Book.new(book_paramas)
    @book.save
    redirect_to book_path(@book.id)
  end

  private
  def book_params
    paramas.require(:book).permit(:title, :body, :user.id)
  end



end
