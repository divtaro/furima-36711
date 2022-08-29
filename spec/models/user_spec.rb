require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
  
    # 正常系
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、お名前(全角) とお名前カナ(全角) 、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    # 異常系
    context '新規登録できない場合' do

      # ニックネームが必須であること
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      # メールアドレスが必須であること
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      # メールアドレスが一意性であること
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      # メールアドレスは、@を含む必要があること
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      # パスワードが必須であること
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      # パスワードは、6文字以上での入力が必須であること
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    
      # it 'passwordが129文字以上では登録できない' do
      # end


      # パスワードは、半角英数字混合での入力が必須であること
      it '半角英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
        # Password Include both letters and numbers
      end

      it '半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end

      it '全角英数字では登録できない' do
        @user.password = 'ＡＢＣ１２３'
        @user.password_confirmation = 'ＡＢＣ１２３'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end

     # パスワードとパスワード（確認）は、値の一致が必須であること
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    

      # お名前(全角)は、名字と名前がそれぞれ必須であること
      it 'お名前(全角)の「名字」が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'お名前(全角)の「名前」が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須
      it 'お名前(全角)の「名字」が、半角（漢字・ひらがな・カタカナ）では登録できない' do
        @user.last_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      # お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
      it 'お名前(全角)の「名前」が、半角（漢字・ひらがな・カタカナ）では登録できない' do
        @user.first_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      # お名前カナ(全角)は、名字と名前がそれぞれ必須であること
      it 'お名前カナ(全角)の「名字」が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'お名前カナ(全角)の「名前」が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      # お名前カナ(全角)は、全角（カタカナ）での入力が必須であること
      it 'お名前カナ(全角)の「名字」が、半角（漢字・ひらがな・カタカナ）では登録できない' do
        @user.last_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana は全角（カタカナ）で入力してください")
      end

      it 'お名前カナ(全角)の「名前」が、半角（漢字・ひらがな・カタカナ）では登録できない' do
        @user.first_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角（カタカナ）で入力してください")
      end

      it '生年月日が空では登録できない' do
        @user.date_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date birth can't be blank")
      end
    end
  end
end
