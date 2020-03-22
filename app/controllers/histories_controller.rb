class HistoriesController < ApplicationController
  def index
    @user = current_user
    @histories = History.where(user_id: current_user).order(created_at: "DESC").page(params[:page]).per(10)
  end

  def create
  end
end
