require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
      it "nicknameが空だと登録できない" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailは@マークから.がないと登録できない" do
        @user.email = "0000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

    it "パスワードが英数字どちらも１つ以上入っていないと登録できない" do
      @user.password = "0000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it "パスワードは6文字以上入っていないと登録できない" do
      @user.password = "a00"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)", "Password is invalid")
    end

      it "名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "名前が漢字、カタカナ、ひらがな以外では登録できない" do
        @user.first_name = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は漢字、カタカナ、ひらがなで入力して下さい。")
      end

      it "苗字が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "苗字が漢字、カタカナ、ひらがな以外では登録できない" do
        @user.last_name = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は漢字、カタカナ、ひらがなで入力して下さい。")
      end


      it "名前（カナ）が空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "名前（カナ）はカタカナ以外では登録できない" do
        @user.first_name_kana = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい。")
      end


      it "苗字（カナ）が空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "苗字（カナ）はカタカナ以外では登録できない" do
        @user.last_name_kana = "hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力して下さい。")
      end


      it "誕生日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end


  end
end
