class TopsController < ApplicationController
  def index
    render layout: false
    @shop = Shop.new
  end
end
