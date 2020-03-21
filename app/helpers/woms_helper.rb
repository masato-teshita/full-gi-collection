module WomsHelper
  def visit_type(wom)
    if wom.visit_type == "購入"
      content_tag :i, '', class: "fas fa-tshirt"
    elsif wom.visit_type == "売却"
      content_tag :i, '', class: "fas fa-yen-sign"
    else
    end
  end
end
