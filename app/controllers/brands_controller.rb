class BrandsController < ApplicationController
  def index
    keyword = params[:keyword]
    return nil if keyword == ""
    brands = Brand.where(['name ilike ?', "%#{keyword}%"]).order(:name).limit(10)
    genres = Genre.where(['name ilike ?', "%#{keyword}%"])
    shops = Shop.where(['name ilike ?', "%#{keyword}%"])
    @keywords = brands + genres + shops
    respond_to do |format|
      format.json
    end
  end
end
