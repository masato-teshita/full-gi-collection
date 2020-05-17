class ShopsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :move_to_root, except: [:index, :show, :map]
  before_action :set_shop, only: [:edit, :update]
  before_action :set_shop_info, only: [:show, :map]

  def index
    @shops = Shop.paginate(page: params[:page], per_page: 5)
    if params[:user_id].presence
      @user = User.find(params[:user_id])
      render "users/shops"
    end
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save! ? (redirect_to root_path) : (render :new)
  end

  def show
  end

  def edit
  end

  def update
    @shop.update(shop_params) ? (redirect_to shop_path(@shop)) : (render :edit)
  end

  def map
  end

  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def set_shop_info
    if params[:id].present? 
      @shop = Shop.find(params[:id])
    else
      @shop = Shop.find(params[:shop_id])
    end
    @woms = @shop.woms
    @clip = Clip.find_by(user_id: current_user, shop_id: @shop.id)
    @clips = @shop.clips
  end

  def shop_params
    params.require(:shop).permit(:name, :image, :outline, :address, :latitude, :longitude)
  end

  def move_to_root    
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end
