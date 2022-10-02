class UsersController < ApplicationController




  def show

    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page])

  end

  def edit
    @user = User.find(params[:id])
    @book = Book.new
    @users = User.all
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "You have not updated user successfully."
      render "index"
    end

  end

  def index
  @user = current_user
  @book = Book.new
  @users = User.page(params[:page])
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
