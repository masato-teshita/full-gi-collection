class AreasController < ApplicationController
  def index
    return nil if params[:area] == ""
    @areas = Area.where(['name ilike ?', "%#{params[:area]}%"])
    respond_to do |format|
      format.json
    end
  end
end
