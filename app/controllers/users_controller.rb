class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if params[:tag_name]
      @users = User.tagged_with("#{params[:tag_name]}")
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user

      redirect_to users_path, alert: "不正なアクセスです"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '更新できた'
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image, :tag_list)
  end
end
