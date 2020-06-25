class AreasController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    return nil if params[:area] == ""
    @areas = Area.where(['name like ?', "%#{params[:area]}%"])
    respond_to do |format|
      format.json
    end
  end
end
