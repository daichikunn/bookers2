class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path

  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
   # @users = @books.user
  end

  def show
    #@user = User.find(params[:user_id])
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  
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
