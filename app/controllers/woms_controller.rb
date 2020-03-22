class WomsController < ApplicationController
  def index
    if params[:user_id].presence
      @user = User.find(params[:user_id])
      @woms = Wom.where(user_id: current_user).order(created_at: "DESC")
      render "users/woms"
    else
      @shop = Shop.find(params[:shop_id])
      @all_woms = @shop.woms.where.not(rate: nil)
      @woms = @shop.woms.where.not(rate: nil).order("created_at DESC").page(params[:page]).per(10)
      @wom = Wom.new
      @users = @shop.users
      render template: 'shops/woms'
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
