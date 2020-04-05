require 'rails_helper'
describe User do
  describe '#create' do
    it "name/email/password/password_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("ユーザー名が入力されていません。")
    end

  end

end