require 'rails_helper'
describe Wom do
  describe '#create' do
    it "visit_type/rate/title/contentが存在すれば登録できること" do
      wom = build(:wom)
      expect(wom).to be_valid
    end

  end

end