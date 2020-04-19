class HistoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    histories = History.where(user_id: @user.id).order(created_at: "DESC")
    @histories = histories.paginate(page: params[:page], per_page: 5)
  end

  def create
  end
end
