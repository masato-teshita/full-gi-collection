require 'rails_helper'

describe ShopsController, type: :controller do
  
  describe '#index' do
    it 'populates an array of shops orderd by created_at DESC' do
      shops = create_list(:shop, 10)
      get :index
      binding.pry
      expect(assigns(:shops)).to match(shops.sort{|a, b| b.created_at <=> a.created_at })
    end

    it 'renders index' do
      get :index
      expect(response).to render_template :index
    end

  end

end