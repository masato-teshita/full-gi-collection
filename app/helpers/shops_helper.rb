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
      image_tag '/assets/no-image.png', class: 'top-cover-img shop-img'
    end
  end

  def clip_image_present?(shop)
    if shop.shop_images.present?
      image_tag "#{shop.shop_images[0].shop_image}", class: 'clip-shop-img'
    else
      image_tag '/assets/no-image.png', class: 'clip-shop-img'
    end
  end
end
