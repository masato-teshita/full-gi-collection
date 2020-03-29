class BrandsController < ApplicationController
  def index
    keyword = params[:keyword]
    return nil if keyword == ""
    brands = Brand.where(['name ilike ?', "%#{keyword}%"]).limit(5)
    genres = Genre.where(['name ilike ?', "%#{keyword}%"])
    @keywords = brands + genres
    respond_to do |format|
      format.json
    end
  end
end
