class Shops::SearchesController < ApplicationController
  def index
    if params[:keyword].present?
      @shops = Shop.search(params[:keyword])
    elsif params[:area_id].present?
      @shops = Shop.where(area_id: params[:area_id])
    end
  end
end
