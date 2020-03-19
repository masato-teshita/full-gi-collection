class Shops::SearchesController < ApplicationController
  def index
    @shops = Shop.search(params[:keyword])
  end
end
