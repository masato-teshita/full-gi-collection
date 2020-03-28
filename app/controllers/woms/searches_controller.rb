class Woms::SearchesController < ApplicationController
  def index
    @shop = Shop.find(params[:shop_id])
    @woms = Wom.search(params[:visit_type], params[:shop_id]).order("created_at DESC").page(params[:page]).per(10)
    @all_woms = Wom.search(params[:visit_type], params[:shop_id])
    @wom = Wom.new
    @clips = @shop.clips
    @visit_type = params[:visit_type]
    render template: 'shops/woms'
  end
end
