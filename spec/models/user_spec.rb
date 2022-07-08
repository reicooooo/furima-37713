require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context '新規登録ができるとき' do

      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end

    end



    context '新規登録ができない時'do

     it "nicknameが空では登録できない" do 
       @user.nickname = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    
     it "emailが空では登録できない" do 
       @user.email = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it "emailに@がないと登録できない" do 
       @user.email = 'test.com' 
       @user.valid?
       expect(@user.errors.full_messages).to include('Email is invalid')
     end

     it "emailは一意性がないと登録できない" do
       @user.save
       another_user = FactoryBot.build(:user,email:@user.email)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
  
    
     it "passwordが空だと登録できない" do
       @user.password = ''
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it "passwordが6文字以上でないと登録できない" do
       @user.password = 'aaa12' 
       @user.password_confirmation = 'aaa12'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it "passwordが英数字混合でも6文字以上でないと登録できない" do
       @user.password = 'aaa12' 
       @user.password_confirmation = 'aaa12'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it "passwordが数字だけでは登録できない" do 
       @user.password = '123456' 
       @user.password_confirmation = '123456'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
     end

      it "passwordが英字だけでは登録できない" do 
       @user.password = 'abcdef' 
       @user.password_confirmation = 'abcdef'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordが全角では登録できない" do
       @user.password = 'ああああああ' 
       @user.password_confirmation = 'ああああああ'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordとpassword_confimationが不一致では登録できない" do
       @user.password = 'a12345' 
       @user.password_confirmation = '12345a' 
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

     it "family_nameが空だと登録できない" do 
       @user.family_name = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include("Family name Full=width characters")
     end

     it "first_nameが空だと登録できない" do 
       @user.first_name = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include("First name Full=width characters")
     end

     it "family_name_kanaが空だと登録できない" do
       @user.family_name_kana = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include("Family name kana Family_name_kana Full-width katakana characters")
     end

     it "first_name_kanaが空だと登録できない" do 
       @user.first_name_kana = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana First_name_kana Full-width katakana characters")
     end

     it "family_nameが全角の漢字でなければ登録できない" do
      @user.family_name = 'yamada' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Family_name_kana Full-width katakana characters")
     end

     it "family_nameが全角のひらがなでなければ登録できない" do
      @user.family_name = 'yamada' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Family_name_kana Full-width katakana characters")
     end

     it "family_nameが全角のカタカナでなければ登録できない" do
      @user.family_name = 'yamada' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Family_name_kana Full-width katakana characters")
     end

     it "first_name全角の漢字でなければ登録できない" do
       @user.first_name = 'rikutarou' 
       @user.valid?
       expect(@user.errors.full_messages).to include ("Family name kana Family_name_kana Full-width katakana characters")
     end

     it "first_name全角のひらがなでなければ登録できない" do
      @user.first_name = 'rikutarou' 
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name kana Family_name_kana Full-width katakana characters")
    end

    it "first_name全角のカタカナでなければ登録できない" do
      @user.first_name = 'rikutarou' 
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name kana Family_name_kana Full-width katakana characters")
    end

     it "family_name_kana全角カタカナでなければ登録できない" do 
       @user.family_name_kana = 'やまだ' 
       @user.valid?
       expect(@user.errors.full_messages).to include("Family_name_kana Full-width katakana characters")
     end

     it "first_name_kana全角カタカナでなければ登録できない" do
       @user.first_name_kana = 'りくたろう' 
       @user.valid?
       expect(@user.errors.full_messages).to include("First_name_kana Full-width katakana characters")
     end

     it "birthdayが空だと登録できない" do
       @user.birthday = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include ("Birthday can't be blank")
     end

    end
  end
end