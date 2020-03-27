class Shops::SearchesController < ApplicationController
  def index
    if params[:area_id].present?
      @shops = Shop.where(area_id: params[:area_id])
    elsif params[:genre_id].present?
      @shops = Shop.includes(:genres).where(genres: { id: params[:genre_id]})
    else
      @shops = Shop.search(params[:keyword])
    end
  end
end
