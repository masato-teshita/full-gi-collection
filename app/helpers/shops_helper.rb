module ShopsHelper
  def last_wom_title(shop)
    if shop.woms.where.not(rate: nil).present?
      shop.woms.where.not(rate: nil).last.title
    else
      "(口コミ未投稿)"
    end
  end

  def last_wom_user(shop)
    if shop.woms.where.not(rate: nil).present?
      shop.woms.where.not(rate: nil).last.user.name
    else
      ""
    end
  end
  
  def last_wom_content(shop)
    if shop.woms.where.not(rate: nil).present?
      shop.woms.where.not(rate: nil).last.content
    else
      "まだ口コミが投稿されていません"
    end
  end

  def image_present?(shop)
    if shop.shop_images.present?
      image_tag "#{shop.shop_images[0].shop_image}", class: 'top-cover-img shop-img'
    else
      image_tag asset_path('no-image.png'), class: 'top-cover-img shop-img'
    end
  end

  def clip_image_present?(shop)
    if shop.shop_images.present?
      image_tag "#{shop.shop_images[0].shop_image}", class: 'clip-shop-img'
    else
      image_tag asset_path('no-image.png'), class: 'clip-shop-img'
    end
  end

  def search_result_word(genre, brand, area_keyword, searched_word)
    if searched_word.present? && area_keyword.present?
      "'#{area_keyword}'の'#{searched_word}' を含む古着屋"
    elsif searched_word.present?
      "'#{searched_word}' を含む古着屋"
    elsif brand.present?
      "#{brand.name} を取り扱う古着屋"
    elsif genre.present?
      "#{genre.name} の古着屋"
    elsif area_keyword.present?
      "#{area_keyword} の古着屋"
    else
    end
  end
end
