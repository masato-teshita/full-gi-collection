module UsersHelper
  def user_image_present?(user)
    if user.image.present?
      image_tag user.image.url, class: 'user-icon-img'
    else
      image_tag '/assets/no-image.png', class: 'user-icon-img'
    end
  end
end
