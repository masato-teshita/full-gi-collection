module WomsHelper
  def visit_type(wom)
    if wom.visit_type == "購入"
      content_tag :i, '', class: "fas fa-tshirt"
    elsif wom.visit_type == "売却"
      content_tag :i, '', class: "fas fa-yen-sign"
    else
    end
  end
  def woms_count(woms)
    if woms.count <= 20
      woms.count
    else
      "20"
    end
  end
  def wom_visit_date(wom)
    if wom.visit_date.present?
      "#{wom.visit_date.strftime('%Y/%m')}訪問"
    end
  end
end
