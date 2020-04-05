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

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスが入力されていません。")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "", password_confirmation: "")
      user.valid?
      expect(user.errors[:password]).to include("パスワードが入力されていません。")
    end

    it "passwordが存在しても、password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("パスワード(確認)の入力が一致しません")
    end

    it "重複したnameが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: "test2@teshita.com")
      another_user.valid?
      expect(another_user.errors[:name]).to include("このユーザー名は既に使用されています。")
    end

    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, name: "teshita2")
      another_user.valid?
      expect(another_user.errors[:email]).to include("このメールアドレスは既に使用されています。")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("パスワードは6文字以上に設定して下さい。")
    end

  end

end