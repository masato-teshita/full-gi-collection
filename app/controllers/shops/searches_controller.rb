class Shops::SearchesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    area_id = params[:area_id]
    genre_id = params[:genre_id]
    brand_id = params[:brand_id]
    @searched_word = params[:keyword]
    @area = params[:area]
    if area_id.present?
      @shops = Shop.where(area_id: area_id)
      @keyword = "#{Area.find(area_id).name} の古着屋"
      @result = "#{@keyword} #{@shops.count}件"
    elsif genre_id.present?
      @shops = Shop.includes(:genres).where(genres: { id: genre_id})
      @keyword = "#{Genre.find(genre_id).name} の古着屋"
      @result = "#{@keyword} #{@shops.count}件"
    elsif brand_id.present?
      @shops = Shop.includes(:brands).where(brands: { id: brand_id})
      @keyword = "#{Brand.find(brand_id).name} を取り扱う古着屋"
      @result = "#{@keyword} #{@shops.count}件"
    elsif @searched_word.present? && @area.present?
      @shops = Shop.search(@area, @searched_word)
      @keyword = "'#{@area}'の'#{@searched_word}' を含む古着屋"
      @result = "#{@keyword} #{@shops.count}件"
    elsif @area.present?
      @shops = Shop.search(@area, @searched_word)
      @keyword = "'#{@area}'の古着屋"
      @result = "#{@keyword} #{@shops.count}件"
    elsif @searched_word.present?
      @shops = Shop.search(@area, @searched_word)
      @keyword = "'#{@searched_word}' を含む古着屋"
      @result = "#{@keyword} #{@shops.count}件"
    else
      redirect_to shops_path
    end
    
  end
end
