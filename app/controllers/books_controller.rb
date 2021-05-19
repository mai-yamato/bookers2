class BooksController < ApplicationController

  def new
  end

  def create
  end

  def index
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.find(current_user.id)


  end

  def destroy
  end

end
