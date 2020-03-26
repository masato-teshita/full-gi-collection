class TopsController < ApplicationController
  def index
    @shop = Shop.new
    @shops = Shop.all.order(:id)
    @areas = Area.all.order(:id)
    @top_areas = Area.limit(5).order_by_shops
    render layout: false
  end
end
