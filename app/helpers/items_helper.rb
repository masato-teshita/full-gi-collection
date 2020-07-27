module ItemsHelper
  def show_price(item)
    "¥#{item.price.to_s(:delimited)}"
  end
  
  def show_status(item)
    "コンディション：#{item.item_status.name}（#{item.item_status.definition}）"
  end

  def show_size(item)
    "サイズ： #{item.size}"
  end
end
