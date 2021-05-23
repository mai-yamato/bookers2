class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user,only: [:edit,:update]


  def new
    if @book.save
      flash[:notice] = "new successfully"
    end
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

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


private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
        @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to users_path
    end
  end

end