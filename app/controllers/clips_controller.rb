class ClipsController < ApplicationController
  def index
    @user = current_user
    @clips = Clip.where(user_id: current_user).order(created_at: "DESC").page(params[:page]).per(10)
  end

  def create
    shop = Shop.find(params[:shop_id])
    clip = Clip.new(user_id: current_user, shop_id: shop.id)
    if clip.save
      redirect_to shop_path(shop.id)
    end
  end

  def destroy
    clip = Clip.where(user_id: current_user).where(shop_id: params[:shop_id])
    clip.destroy
  end
end
