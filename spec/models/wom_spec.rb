require 'rails_helper'
describe Wom do
  describe '#create' do
    it "visit_type/rate/title/contentが存在すれば登録できること" do
      wom = build(:wom)
      expect(wom).to be_valid
    end

    it "visit_typeがない場合は登録できないこと" do
      wom = build(:wom, visit_type: "")
      wom.valid?
      expect(wom.errors[:visit_type]).to include("を入力してください")
    end

    it "rateがない場合は登録できないこと" do
      wom = build(:wom, rate: "")
      wom.valid?
      expect(wom.errors[:rate]).to include("を入力してください")
    end

  end

end