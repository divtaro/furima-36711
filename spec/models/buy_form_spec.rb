require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  describe '発送先データ登録' do
    before do 
      user = FactoryBot.create(:user)
      @buy_form = FactoryBot.build(:buy_form, user_id: user.id)
    end

    context '発送先データを登録できる場合' do
      it '建物名が無くても他のデータが存在すれば登録できる' do
        expect(@buy_form).to be_valid
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列であれば登録できる' do
        post_code = '123-4567'
        expect(@buy_form).to be_valid
      end

      it '都道府県が存在すれば登録できる' do
        prefecture_id  = '2'
        expect(@buy_form).to be_valid
      end

      it '市区町村が存在すれば登録できる' do
        municipalities  = '名古屋市'
        expect(@buy_form).to be_valid
      end

      it '番地が存在すれば登録できる' do
        house_num  = '1-1-1'
        expect(@buy_form).to be_valid
      end

      it '建物名が存在しなくても登録できる' do
        building  = ''
        expect(@buy_form).to be_valid
      end

      it '電話番号が存在すれば登録できる' do
        tel  = '09012345678'
        expect(@buy_form).to be_valid
      end

      it '電話番号が10桁以上11桁以内の半角数値であれば登録できる' do
        tel  = '09012345678'
        expect(@buy_form).to be_valid
      end
    end

    context '発送先を登録できない場合' do
      it '郵便番号が存在しなければ登録できない' do
        
        @buy_form.post_code = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code can't be blank")
      end  
      
      it '郵便番号に「ハイフン」がなければ登録できない' do
        @buy_form.post_code = '1234567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code は、半角数字3桁＋ハイフン（-）＋半角数字4桁の形式で入力してください。")
      end

      it '郵便番号の「ハイフン」前後の桁数が合っていないと登録できない' do
        @buy_form.post_code = '1234-567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code は、半角数字3桁＋ハイフン（-）＋半角数字4桁の形式で入力してください。")
      end

      it '郵便番号が全角数字の場合は登録できない' do
        @buy_form.post_code = '１２３４-５６７'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code は、半角数字3桁＋ハイフン（-）＋半角数字4桁の形式で入力してください。")
      end

      it '都道府県が存在しなければ登録できない' do
        @buy_form.prefecture_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が存在しなければ登録できない' do
        @buy_form.municipalities = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が存在しなければ登録できない' do
        @buy_form.house_num = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("House num can't be blank")
      end

      it '電話番号が存在しなければ登録できない' do
        @buy_form.tel = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号の桁数が合っていなければ登録できない' do
        @buy_form.tel = '090123456'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Tel は10桁以上11桁以内の半角数値のみで入力してください")
      end

      it '電話番号が半角数字でなければ登録できない' do
        @buy_form.tel = '０９０１２３４５６７８'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Tel は10桁以上11桁以内の半角数値のみで入力してください")
      end

      it '電話番号に「ハイフン」が入っていると登録できない' do
        @buy_form.tel = '090-1234-5678'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Tel は10桁以上11桁以内の半角数値のみで入力してください")
      end
    end
  end
end