class ShopsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :move_to_root, except: [:index, :show]

  def index
    @shops = Shop.all.order(created_at: "DESC").page(params[:page]).per(10)
    if params[:user_id].presence
      @user = User.find(params[:user_id])
      render "users/shops"
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
    @clip = Clip.find_by(user_id: current_user, shop_id: @shop.id)
    @clips = @shop.clips
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :image, :outline)
  end

  def move_to_root    
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end
