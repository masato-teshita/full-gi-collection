require 'rails_helper'

describe WomsController, type: :controller do
  let(:user) { create(:user) }
  let(:shop) { create(:shop) }

  describe '#create' do
    let(:params) {{user_id: user.id, shop_id: shop.id, wom: attributes_for(:wom)}}

    #------------------------------------------------------------------------------
    #ログインしている場合
    #------------------------------------------------------------------------------
    context 'log in' do
      before do
        login user
      end
      
      ###ログインしている状態かつ、口コミの保存に成功した場合
      context 'can save' do
        subject {
          post :create,
          params: params
        }

        it 'count up wom' do
          expect{subject}.to change(Wom, :count).by(1)
        end
        
        it 'redirects to shop_woms_path' do
          subject
          expect(response).to redirect_to(shop_woms_path(shop.id))
        end
      end      
    end
  end
end