class WomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:user_id].presence
      @user = User.find(params[:user_id])
      @woms = Wom.where(user_id: current_user).order(created_at: "DESC")
      render "users/woms"
    else
      @shop = Shop.find(params[:shop_id])
      @all_woms = @shop.woms.where.not(rate: nil)
      @woms = @shop.woms.where.not(rate: nil).order("created_at DESC").page(params[:page]).per(10)
      @wom = Wom.new
      @clips = @shop.clips
      @clip = Clip.where(user_id: current_user).where(shop_id: @shop.id)
      render template: 'shops/woms'
    end
  end

  def new
    @wom = Wom.new
    @shop = Shop.find(params[:shop_id])
    @woms = @shop.woms.where.not(rate: nil).order("created_at DESC").page(params[:page]).per(10)
    @all_woms = @shop.woms.where.not(rate: nil)
    @clips = @shop.clips
  end

  def create
    @wom = Wom.new(wom_params)
    @shop = Shop.find(params[:shop_id])
    @woms = @shop.woms.where.not(rate: nil).order("created_at DESC").page(params[:page]).per(10)
    @all_woms = @shop.woms.where.not(rate: nil)
    @clips = @shop.clips
    if @wom.save
      if History.where.not(user_id: params[:user_id]).where.not(shop_id: params[:shop_id])
        History.create!(user_id: current_user.id, shop_id: params[:shop_id])
      end
      redirect_to shop_woms_path(params[:shop_id])
    else
      render :new
    end
  end

  def edit
    @wom = Wom.find(params[:id])
    @shop = Shop.find(params[:shop_id])
    @woms = @shop.woms.where.not(rate: nil).order("created_at DESC").page(params[:page]).per(10)
    @all_woms = @shop.woms.where.not(rate: nil)
    @clips = @shop.clips
  end

  def update
    wom = Wom.find(params[:id])
    wom.update(wom_params)
    redirect_to shop_woms_path(params[:shop_id])
  end

  def destroy
    wom = Wom.find(params[:id])
    wom.destroy
    redirect_to shop_woms_path(params[:shop_id])
  end

  private
  def wom_params
    params.require(:wom).permit(:title, :content, :rate, :visit_type, :visit_date).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
