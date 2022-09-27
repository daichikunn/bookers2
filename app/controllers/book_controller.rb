class BookController < ApplicationController
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
    
  end

  def show

  end


  def book_params
    params.permit(:title, :body)
  end

end
