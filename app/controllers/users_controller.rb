class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures
  end
  
  def edit
    @user = User.find(params[:id])
    unless @user == current_user
          redirect_to user_path(@user)
       end
  end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :name, :favorite, :museum)
    end

  end