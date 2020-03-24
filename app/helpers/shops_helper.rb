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

end
