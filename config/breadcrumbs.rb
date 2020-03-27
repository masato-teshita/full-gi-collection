crumb :root do
  link "古着navi", root_path
end

# shop#index
crumb :shops do
  link "Shop一覧", shops_path
  parent :root
end

# shop/searches#index
crumb :search_shops do |keyword|
  link "#{keyword}古着屋"
  parent :shops
end

# shop#show
crumb :show_shop do |shop|
  if shop.present?
  else
    shop = Shop.find(params[:shop_id])
  end
  link shop.name, shop
  parent :shops
end

# shop#woms
crumb :shop_woms do |shop|
  shop = Shop.find(params[:shop_id])
  link "#{shop.name} の口コミ一覧", shop_woms_path(shop)
  parent :show_shop, shop
end

# shop/woms#new
crumb :shop_wom_new do |shop|
  shop = Shop.find(params[:shop_id])
  link "#{shop.name} への口コミ投稿", new_shop_wom_path(shop)
  parent :show_shop, shop
end

# shop/woms#edit
crumb :shop_wom_edit do |shop|
  shop = Shop.find(params[:shop_id])
  link "口コミ編集", new_shop_wom_path(shop)
  parent :shop_woms, shop
end

# shop#edit
crumb :edit_shop do |shop|
  link "Edit #{shop.name}", edit_shop_path(shop)
  parent :show_shop, shop
end

# shop#new
crumb :new_shop do
  link "New shop", new_shop_path
end

# user#new

# user#show
crumb :user do |user|
  if user.present?
    link "#{user.name}さん のマイページ"
  elsif params[:user_id].present?
    user = User.find(params[:user_id])
    link "#{user.name}さん のマイページ", user_path(user)
  else
    user = current_user
    link "#{user.name}さん のマイページ", user_path(current_user)
  end
  parent :root
end

# user/shop#index
crumb :user_shops do |user|
  link "保存済み一覧"
  parent :user
end

# user/history#index
crumb :user_histories do |user|
  link "行ったお店一覧"
  parent :user
end

# user/clip#index
crumb :user_clips do |user|
  link "保存済み一覧"
  parent :user
end

# devise/registrations#new

# devise/registrations#edit
crumb :user_edit do |user|
  link "ユーザ情報編集"
  parent :user
end

