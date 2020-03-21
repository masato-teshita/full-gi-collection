class ShopsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    if params[:user_id].presence
      @user = User.find(params[:user_id])
      @shops = Shop.all.order(created_at: "DESC")
      render "users/shops"
    else
      @shops = Shop.all.order(created_at: "DESC")
    end
  end

  def new
    @shop = Shop.new
  end

  def create
    Shop.create!(shop_params)
  end

  def show
    @shop = Shop.find(params[:id])
    @wom = Wom.new
    @woms = @shop.woms
    @users = @shop.users
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :image, :outline)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
