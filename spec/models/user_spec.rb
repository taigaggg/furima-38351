require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it '全ての情報が存在すれば登録できる' do
      end
    end

    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'taig5'
        @user.password_confirmation = 'taig5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = 'taigagg'
        @user.password_confirmation = 'taigagg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)は、名字が必須であること' do
        @user.last_name_full = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name full can't be blank")
      end
      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name_full = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full can't be blank")
      end
      it ' お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name_kana = "yamada"
        @user.first_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid","First name kana is invalid")
      end
      it 'お名前カナ(全角)は、名字が必須であること' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)は、名前が必須であること' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = "yamada"
        @user.first_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid","First name kana is invalid")
      end
      it '生年月日が必須であること' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
