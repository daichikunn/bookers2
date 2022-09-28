class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_index_path

  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @books = Book.find(params[:user_id])
  
  end

  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to book_index_path
  end

  def book_params
    params.permit(:title, :body)
  end
  
end
