class HistoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @histories = History.where(user_id: @user.id).order(created_at: "DESC").page(params[:page]).per(10)
  end

  def create
  end
end
