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

      ###ログインしている状態かつ、口コミの保存に失敗した場合
      context 'can not save' do
        let(:invalid_params) {{user_id: user.id, shop_id: shop.id, wom: attributes_for(:wom, content: nil)}}

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          expect{subject}.not_to change(Wom, :count)
        end

        it 'renders new' do
          subject
          expect(response).to render_template :new
        end
      end
      
    end

    #------------------------------------------------------------------------------
    #ログインしていない場合
    #------------------------------------------------------------------------------
    context 'not log in' do
      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end