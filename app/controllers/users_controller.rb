class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books
  end

  def index
  	@user = User.find(params[:id])
  	@book = Book.new
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update
  	redirect_to user_path(@user.id)
  end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :image)
	end

	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end
end