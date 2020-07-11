class WomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_shop, only: [:index, :new, :create, :edit]
  before_action :set_new_wom, only: [:index, :new]
  before_action :set_wom, only: [:edit, :destroy]
  before_action :set_woms, only: [:index, :new, :create, :edit]
  before_action :set_all_woms, only: [:index, :new, :create, :edit]
  before_action :set_clip_user_and_shop, only: [:index, :new]
  before_action :set_clips, only: [:index, :new, :create, :edit]

  def index
    render template: 'shops/woms'
  end

  def new
  end

  def create
    @wom = Wom.new(wom_params)
    if @wom.save
      if History.where(user_id: current_user.id).where(shop_id: params[:shop_id]) == []
        History.create!(user_id: current_user.id, shop_id: params[:shop_id])
      end
      redirect_to shop_woms_path(params[:shop_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    wom = Wom.find(params[:id])
    wom.update(wom_params)
    redirect_to shop_woms_path(params[:shop_id])
  end

  def destroy
    if @wom.destroy
      redirect_to shop_woms_path(params[:shop_id])
    else
      render :index
    end
  end

  private
  def wom_params
    params.require(:wom).permit(:title, :content, :rate, :visit_type).merge(user_id: current_user.id, shop_id: params[:shop_id], visit_date: params[:visit_date])
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_new_wom
    @wom = Wom.new
  end

  def set_wom
    @wom = Wom.find(params[:id])
  end

  def set_woms
    woms = @shop.woms.wom_includes.where.not(rate: nil).order('created_at DESC')
    @woms = woms.paginate(page: params[:page], per_page: 5)
  end

  def set_all_woms
    @all_woms = @shop.woms.wom_includes.where.not(rate: nil)
  end

  def set_clip_user_and_shop
    @clip = Clip.where(user_id: current_user).where(shop_id: @shop.id)
  end

  def set_clips
    @clips = @shop.clips
  end
end
