class ShopsController < ApplicationController
  require 'will_paginate/array'
  skip_before_action :authenticate_user!
  before_action :set_shop, only: [:edit, :update, :delete]
  before_action :new_shop, only: [:new]
  before_action -> {
    admin_check(@shop) }, only: [:new, :edit, :update, :delete]
  before_action :set_shop_info, only: [:show, :map]

  def index
    @shops = Shop.shop_includes.paginate(page: params[:page], per_page: 5)
    @result = @shops.count
    @keyword = "全ての古着屋"
    sort = params[:sort] || "created_at DESC"
    shop_sort(sort)
    if params[:user_id].presence
      @user = User.find(params[:user_id])
      render "users/shops"
    end
  end

  def new
    @shop.shop_images.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      params[:shop][:shop_image].each do |image|
        @shop.shop_images.create(shop_image: image, shop_id: @shop.id)
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @shop.shop_images.new unless @shop.shop_images.present?
  end

  def update
    if @shop.update(shop_params)
      if add_shop_images = params[:shop][:shop_image]
        add_shop_images.each do |image|
          @shop.shop_images.create(shop_image: image, shop_id: @shop.id)
        end
      end
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def map
  end

  def search
    genre = Genre.find_by(name: params.require(:q)[:genres_name_eq])
    brand = Brand.find_by(name: params.require(:q)[:brands_name_eq])
    @rate_range = RateRange.find_by(id: params[:rate_range])
    area_keyword = params.require(:q)[:area_name_cont]
    searched_word = params.require(:q)[:name_or_outline_or_brands_name_or_genres_name_cont]
    @keyword = view_context.search_result_word(genre, brand, area_keyword, searched_word, @rate_range)
    # 検索ワードがなければ、店舗一覧にリダイレクト

    @q = Shop.shop_includes.search(search_params)
    if @rate_range.present?
      # @shops = @q.result(distinct: true).where('rating_average >= ?', rate_range.min).order(sort).paginate(page: params[:page], per_page: 5)
      @shops = @q.result(distinct: true)
        .select('shops.*', 'sum(woms.rate) AS rate_sum')
        .select('shops.*', 'count(woms.id) AS rate_count')
        .left_joins(:woms)
        .group('shops.id')
        .having('rate_sum/rate_count >=?', @rate_range.min)
      @result = @shops.length
    else
      @shops = @q.result(distinct: true)
      @result = @shops.count
    end

    # ソートを判定
    sort = params[:sort] || "created_at DESC"
    shop_sort(sort)
    redirect_to shops_path(sort: sort) if @keyword == nil && @rate_range == nil
  end

  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def new_shop
    @shop = Shop.new
  end

  def set_shop_info
    if params[:id].present? 
      @shop = Shop.find(params[:id])
    else
      @shop = Shop.find(params[:shop_id])
    end
    @woms = @shop.woms
    @clip = Clip.find_by(user_id: current_user, shop_id: @shop.id)
    @clips = @shop.clips
  end

  def shop_params
    params.require(:shop).permit(
      :name,
      :image,
      :outline,
      :phone_number,
      :postal_code,
      :address,
      :latitude,
      :longitude,
      :area_id,
      genre_ids: [],
      brand_ids: [],
      shop_images_attributes: [:_destroy, :id]
    ).merge(area_id: params[:shop][:area_id])
  end

  def search_params
    params.require(:q).permit!
  end

  def shop_sort(sort)
    # ソートを判定
    case sort
    when "rate_desc" then
      @shops = @shops
        .joins("left join woms on shops.id=woms.shop_id")
        .group("shops.id")
        .order("sum(woms.rate)/count(woms.id) desc")
        .paginate(page: params[:page], per_page: 5)
    when "woms_count_desc" then
      @shops = @shops.select('shops.*', 'count(woms.id) AS woms')
        .left_joins(:woms)
        .group('shops.id')
        .order('woms DESC')
        .paginate(page: params[:page], per_page: 5)
    when "clips_count_desc" then
      @shops = @shops.select('shops.*', 'count(clips.id) AS clips')
        .left_joins(:clips)
        .group('shops.id')
        .order('clips DESC')
        .paginate(page: params[:page], per_page: 5)
    else
      @shops = @shops.order(sort).paginate(page: params[:page], per_page: 5)
    end
  end
end
