class TopsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_shop_search_query

  def index
    @shops = Shop.all.order(:id)
    @shop = Shop.find_by(shop_admin: current_user) if user_signed_in?
    @woms = Wom.all
    @top_areas = Area.limit(5).order_by_shops
    @areas = Area.all.order(:id)
    @top_genres = Genre.limit(5).order_by_shops
    @genres = Genre.all.order(:id)
    @top_brands = Brand.limit(5).order_by_shops
    @brands = Brand.all.order(:name)
    @items = Item.all
    render layout: false
  end
end