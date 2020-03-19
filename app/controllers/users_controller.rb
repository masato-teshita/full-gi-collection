class UsersController < ApplicationController
  before_action :move_to_index
  
  def show
    @user = User.find(params[:id])
  end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end
