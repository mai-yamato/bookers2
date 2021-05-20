class BooksController < ApplicationController

  def new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book)
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @users = User.find(current_user.id)
    @newbook = Book.new

  end



  def destroy

  end

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
