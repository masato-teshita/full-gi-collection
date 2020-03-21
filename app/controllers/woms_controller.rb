class WomsController < ApplicationController
  def index
    if params[:user_id].presence
      @user = User.find(params[:user_id])
      @woms = Wom.all.order(created_at: "DESC")
      render "users/woms"
    else
      @shops = Shop.all
    end
  end
  
  def create
    @wom = Wom.create(wom_params)
  end

  private
  def wom_params
    params.require(:wom).permit(:title, :content, :rate, :visit_type, :visit_date).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
