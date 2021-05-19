class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @users = User.find(current_user.id)

  end


  def index
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
    new_user_registration(name: user_params[:name], introduction: user_params[:introduction], user_id: current_user.id)
  end

end

private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

