require 'rails_helper'
describe Shop do
  describe '#create' do
    it "nameが存在すれば登録できること" do
      shop = build(:shop)
      expect(shop).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      shop = build(:shop, name: "")
      shop.valid?
      expect(shop.errors[:name]).to include("を入力してください")
    end
    
  end

end