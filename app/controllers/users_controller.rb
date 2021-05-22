class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @users = User.find(current_user.id)
    @book = Book.new
    @newbook = Book.all
  end


  def index
    @users = User.all
    @user = current_user
    @book = Book.new

  end



  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  def edit
    @user = User.find(params[:id])

  end



end

private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

