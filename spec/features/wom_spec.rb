require 'rails_helper'

feature 'wom', type: :feature do
  let(:user) { create(:user) }
  let(:area) { create(:area) }
  let(:shop) { create(:shop, area_id: area.id)}

  scenario 'ユーザーの情報が更新されていること' do
    # ログイン前には、投稿ボタンを押すとログイン画面にリダイレクトされる
    visit shop_woms_path(shop.id)
    find('.post-btn').click
    expect(current_path).to eq new_user_session_path

    # ログイン処理
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq new_shop_wom_path(shop.id)
    
    # 口コミの投稿
    expect {
      find('input[value="購入"]').set(true)
      find('input[name="wom[rate]"]', visible: false).set(5)
      fill_in 'wom_title', with: 'フィーチャスペックのテスト'
      fill_in 'wom_content', with: 'うまくテスト通ってくれるといいな。どうかな'
      find('input[name="wom-post"]').click
    }.to change(Wom, :count).by(1)
  end
end