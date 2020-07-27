class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_shop
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_items, only: [:index, :new, :create, :edit]
  # before_action :set_all_woms, only: [:index, :new, :create, :edit]
  before_action :set_clip_user_and_shop, only: [:index, :new]
  # before_action :set_clips, only: [:index, :new, :create, :edit]

  def index
    @top_brands = @shop.brands.limit(5)
    @brands = @shop.brands.order(:name)
    render template: 'shops/items'
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    @item.save! ? (redirect_to shop_items_path(@shop.id)):(render :new)
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params) ? (redirect_to shop_items_path(@shop.id)):(render :edit)
  end

  def destroy
    @item.destroy ? (redirect_to shop_items_path(@shop.id)):(render :index)
  end

  private
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def set_items
    @items = @shop.items.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def item_params
    params.require(:item).permit(
      :name,
      :explanation,
      :price,
      :item_status_id,
      :size,
      :size_detail,
      images: [],
    )
    .merge(shop_id: params[:shop_id])
  end

  def set_clip_user_and_shop
    @clip = Clip.where(user_id: current_user).where(shop_id: @shop.id)
  end
end
