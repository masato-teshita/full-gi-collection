class GenresController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    keyword = params[:keyword]
    return nil if keyword == ""
    brands = Brand.where(['name like ?', "%#{keyword}%"]).order(:name).limit(10)
    genres = Genre.where(['name like ?', "%#{keyword}%"])
    shops = Shop.where(['name like ?', "%#{keyword}%"])
    @keywords = brands + genres + shops
    respond_to do |format|
      format.json
    end
  end
end
