class UsersController < ApplicationController

  def show
  	@user = current_user || User.find_by(id:session[:user_id])
  	@book = Book.new
  	@books = @user.books
  end

  def index
  	@user = current_user || User.find_by(id:session[:user_id])
  	@book = Book.new
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to user_path(user.id)
  end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end
end