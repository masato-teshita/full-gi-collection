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
    @shop.shop_images.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      params[:shop][:shop_image].each do |image|
        @shop.shop_images.create(shop_image: image, shop_id: @shop.id)
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @shop.shop_images.new unless @shop.shop_images.present?
  end

  def update
    if @shop.update(shop_params)
      if add_shop_images = params[:shop][:shop_image]
        add_shop_images.each do |image|
          @shop.shop_images.create(shop_image: image, shop_id: @shop.id)
        end
      end
      redirect_to shop_path(@shop)
    else
      render :edit
    end
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
    params.require(:shop).permit(
      :name,
      :image,
      :outline,
      :phone_number,
      :postal_code,
      :address,
      :latitude,
      :longitude,
      :area_id,
      genre_ids: [],
      brand_ids: [],
      shop_images_attributes: [:_destroy, :id]
    ).merge(area_id: params[:shop][:area_id])
  end

  def move_to_root    
    redirect_to root_path unless user_signed_in? && current_user.admin?
  end
end
