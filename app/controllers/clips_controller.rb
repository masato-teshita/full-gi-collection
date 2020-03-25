class ClipsController < ApplicationController
  def index
    @user = current_user
    @clips = Clip.where(user_id: current_user).order(created_at: "DESC").page(params[:page]).per(10)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @clips = @shop.clips
    @clip = Clip.new(user_id: current_user.id, shop_id: @shop.id)
    @all_woms = @shop.woms.where.not(rate: nil)
    @wom = Wom.new
    @woms = @shop.woms.where.not(rate: nil).order("created_at DESC").page(params[:page]).per(10)
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
