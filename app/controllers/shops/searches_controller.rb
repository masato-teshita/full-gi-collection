class Shops::SearchesController < ApplicationController
  def index
    area_id = params[:area_id]
    genre_id = params[:genre_id]
    brand_id = params[:brand_id]
    if area_id.present?
      @shops = Shop.where(area_id: area_id)
      @keyword = "#{Area.find(area_id).name}の"
    elsif genre_id.present?
      @shops = Shop.includes(:genres).where(genres: { id: genre_id})
      @keyword = "#{Genre.find(genre_id).name}の"
    elsif brand_id.present?
      @shops = Shop.includes(:brands).where(brands: { id: brand_id})
      @keyword = "#{Brand.find(brand_id).name}を取り扱う"
    else
      @shops = Shop.search(params[:keyword])
      @keyword = "#{params[:keyword]}を含む"
    end
  end
end
