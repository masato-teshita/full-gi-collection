class BrandsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    keyword = params[:keyword]
    return nil if keyword == ""
    @brands = Brand.where(['name like ?', "%#{keyword}%"]).order(:name).limit(10)
    respond_to do |format|
      format.json
    end
  end
end
