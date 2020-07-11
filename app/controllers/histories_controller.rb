class HistoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @user = User.find(params[:user_id])
    @histories = History.history_includes.where(user_id: @user.id).order(created_at: "DESC").paginate(page: params[:page], per_page: 5)
  end

  def create
  end
end
