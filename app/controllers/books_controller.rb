class BooksController < ApplicationController

  def new
  end

  def create
    book = Book.new
    book.user_id = current_user.id
    books.save
    redirect_to book_path(book)
  end

  def index
    @books = Book.all
    @user = current_user
    @newbook = Book.new
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @users = User.find(current_user.id)
    @newbook = Book.new
    @newbooks = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end



  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
