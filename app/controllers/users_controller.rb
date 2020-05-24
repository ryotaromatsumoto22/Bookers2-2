class UsersController < ApplicationController

  before_action :authenticate_user!
  # before_action :correct_user, only:[:edit, :update]

  def show
  	@user = User.find(params[:id])
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
       if @user == current_user
          render action: :edit
       else
          redirect_to user_path(current_user.id)
     end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	   redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end

end