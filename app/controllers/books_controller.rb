class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_book,only: [:edit,:update]

  def new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to edit_book_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      if @book.update(book_params)
        flash[:notice] = "successfully"
        redirect_to book_path(@book)
      else
        render :edit
      end
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      @users = User.all
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
    @users = User.find(current_user.id)
    @newbook = Book.new
    @newbooks = Book.all
  end



  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

    private
    def book_params
      params.require(:book).permit(:title, :body).merge(user_id: current_user.id)
    end


    def correct_book
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
    end
end
