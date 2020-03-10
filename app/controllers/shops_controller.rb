class ShopsController < ApplicationController
  before_action :move_to_index, except: [:index, :search]
  def index
    render layout: false
  end

  def search
    @shops = Shop.search(params[:keyword])
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
