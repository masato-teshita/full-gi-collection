class Shops::SearchesController < ApplicationController
  require 'will_paginate/array'
  skip_before_action :authenticate_user!
  def index
    area_id = params[:area_id]
    genre_id = params[:genre_id]
    brand_id = params[:brand_id]
    @searched_word = params[:keyword]
    @area = params[:area]
    if area_id.present?
      return_shops = Shop.where(area_id: area_id)
      @shops = return_shops.paginate(page: params[:page], per_page: 5)
      @keyword = "#{Area.find(area_id).name} の古着屋"
      @result = "#{@keyword} #{return_shops.count}件"
    elsif genre_id.present?
      return_shops = Shop.includes(:genres).where(genres: { id: genre_id})
      @shops = return_shops.paginate(page: params[:page], per_page: 5)
      @keyword = "#{Genre.find(genre_id).name} の古着屋"
      @result = "#{@keyword} #{return_shops.count}件"
    elsif brand_id.present?
      return_shops = Shop.includes(:brands).where(brands: { id: brand_id})
      @shops = return_shops.paginate(page: params[:page], per_page: 5)
      @keyword = "#{Brand.find(brand_id).name} を取り扱う古着屋"
      @result = "#{@keyword} #{return_shops.count}件"
    elsif @searched_word.present? && @area.present?
      return_shops = Shop.search(@area, @searched_word)
      @shops = return_shops.paginate(page: params[:page], per_page: 5)
      @keyword = "'#{@area}'の'#{@searched_word}' を含む古着屋"
      @result = "#{@keyword} #{return_shops.count}件"
    elsif @area.present?
      return_shops = Shop.search(@area, @searched_word)
      @shops = return_shops.paginate(page: params[:page], per_page: 5)
      @keyword = "'#{@area}'の古着屋"
      @result = "#{@keyword} #{return_shops.count}件"
    elsif @searched_word.present?
      return_shops = Shop.search(@area, @searched_word)
      @shops = return_shops.paginate(page: params[:page], per_page: 5)
      @keyword = "'#{@searched_word}' を含む古着屋"
      @result = "#{@keyword} #{return_shops.count}件"
    else
      redirect_to shops_path
    end
    
  end
end
