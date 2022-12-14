class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    

    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)

    else
      @user = current_user
      @books = Book.page(params[:page])
      flash[:alert] = "You have not created book successfully."
      render :index
    end


  end

  def index
    @books = Book.page(params[:page])
    @book = Book.new
    @user = current_user
   # @users = @books.user
  end

  def edit
     @book = Book.find(params[:id])
     if @book.user == current_user
       render :edit
     else 
       redirect_to books_path
     end
     

  end
  #def edit
    # @book = Book.find(params[:id])
     #if @book.user != current_user
       #redirect_to books_path
     #end
   # end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def show
    #@user = User.find(params[:user_id])
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
