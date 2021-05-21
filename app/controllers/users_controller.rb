class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @users = User.find(current_user.id)
    @book = Book.new
    @newbook = Book.all
  end


  def index
    @users = User.all
    @user = User.find(params[:id])
    @book = Book.new

  end

  def create
    redirect_to books_path
    @user = User.new(user_params)
    if @book.save
      redirect_to user_path
    else
      render :new
    end

  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  def edit
    @user = User.find(params[:id])

  end

  def new

  end

end

private

  def user_params
    params.require(:user).permit(:profile_image)
  end

