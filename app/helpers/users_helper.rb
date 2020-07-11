module UsersHelper
  def user_image_present?(user)
    if user.image.present?
      image_tag user.image.url, class: 'user-icon-img'
    else
      image_tag asset_path('no-image.png'), class: 'user-icon-img'
    end
  end

  def user_icon_present?(user)
    if user.image.present?
      image_tag user.image.url, class: 'user-nav-icon js-user-nav'
    else
      image_tag asset_path('default-icon.png'), class: 'user-nav-icon js-user-nav'
    end
  end

  def user_cover_image_present?(user)
    if user.cover_image.present?
      image_tag user.cover_image.url, id: 'user-cover-img-prev'
    else
      image_tag asset_path('furugi-top.jpeg'), id: 'user-cover-img-prev'
    end
  end

  def user_cover_icon_present?(user)
    if user.cover_image.present?
      image_tag user.cover_image.url, class: 'cover-img'
    else
      image_tag asset_path('furugi-top.jpeg'), class: 'cover-img'
    end
  end
end
