class ClipsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  
  def index
    @user = User.find(params[:user_id])
    clips = Clip.where(user_id: @user).order(created_at: "DESC")
    @clips = clips.paginate(page: params[:page], per_page: 5)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @clips = @shop.clips
    @clip = Clip.new(user_id: current_user.id, shop_id: @shop.id)
    @all_woms = @shop.woms.where.not(rate: nil)
    @wom = Wom.new
    woms = @shop.woms.where.not(rate: nil).order("created_at DESC")
    @woms = woms.paginate(page: params[:page], per_page: 5)
    if @clip.save!
      respond_to do |format|
        format.html { redirect_to shop_path(@shop.id) }
      end
    end
  end

  def destroy
    clip = Clip.find_by(user_id: current_user, shop_id: params[:shop_id])
    clip.destroy
    redirect_to shop_path(params[:shop_id])
  end
end
