class MapsController < ApplicationController
  def index
    @shop = Shop.find(params[:shop_id])
    @map = @shop.map
    @woms = @shop.woms
    @clip = Clip.find_by(user_id: current_user, shop_id: @shop.id)
    @clips = @shop.clips
    render template: 'shops/maps'
  end
end
