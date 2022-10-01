class UsersController < ApplicationController

 def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Welcome! You have signed up successfully.'
      redirect_to user_path
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end




  def show

    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books

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
  @users = User.all
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
