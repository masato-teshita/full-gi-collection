class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :move_to_index, except: :show
  
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user)
    if params[:delete_img]
      @user.image = nil
      @user.save!
      render :show
      return
    else
      @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image, :cover_image)
  end

end
