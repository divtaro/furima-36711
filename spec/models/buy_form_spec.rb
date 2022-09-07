require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  describe 'クレジットカード決済による商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_form = FactoryBot.build(:buy_form, user_id: user.id, item_id: item.id)
    end

    context 'クレジットカード決済による商品購入ができる場合' do
      it 'tokenが存在する' do
        expect(@buy_form).to be_valid
      end

      it '建物名が無くても他のデータが存在する' do
        expect(@buy_form).to be_valid
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列である' do
        post_code = '123-4567'
        expect(@buy_form).to be_valid
      end

      it '都道府県が存在する' do
        prefecture_id = '2'
        expect(@buy_form).to be_valid
      end

      it '市区町村が存在する' do
        municipalities = '名古屋市'
        expect(@buy_form).to be_valid
      end

      it '番地が存在する' do
        house_num  = '1-1-1'
        expect(@buy_form).to be_valid
      end

      it '建物名が存在しなくても良い' do
        building = ''
        expect(@buy_form).to be_valid
      end

      it '電話番号が存在する' do
        tel = '09012345678'
        expect(@buy_form).to be_valid
      end

      it '電話番号が10桁以上11桁以内の半角数値である' do
        tel = '09012345678'
        expect(@buy_form).to be_valid
      end
    end

    context 'クレジットカード決済による商品購入ができない場合' do
      it 'tokenが存在しない' do
        @buy_form.token = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が存在しない' do
        @buy_form.post_code = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号に「ハイフン」が無い' do
        @buy_form.post_code = '1234567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Post code は、半角数字3桁＋ハイフン（-）＋半角数字4桁の形式で入力してください。')
      end

      it '郵便番号の「ハイフン」前後の桁数が合っていない' do
        @buy_form.post_code = '1234-567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Post code は、半角数字3桁＋ハイフン（-）＋半角数字4桁の形式で入力してください。')
      end

      it '郵便番号が全角数字である' do
        @buy_form.post_code = '１２３４-５６７'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Post code は、半角数字3桁＋ハイフン（-）＋半角数字4桁の形式で入力してください。')
      end

      it '都道府県が存在しない' do
        @buy_form.prefecture_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が存在しない' do
        @buy_form.municipalities = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が存在しない' do
        @buy_form.house_num = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("House num can't be blank")
      end

      it '電話番号が存在しない' do
        @buy_form.tel = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号の桁数が合っていない' do
        @buy_form.tel = '090123456'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Tel は10桁以上11桁以内の半角数値のみで入力してください')
      end

      it '電話番号が半角数字ではない' do
        @buy_form.tel = '０９０１２３４５６７８'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Tel は10桁以上11桁以内の半角数値のみで入力してください')
      end

      it '電話番号に「ハイフン」が入っている' do
        @buy_form.tel = '090-1234-5678'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Tel は10桁以上11桁以内の半角数値のみで入力してください')
      end

      it '電話番号が9桁以下' do
        # binding.pry
        @buy_form.tel = '090-1234-56'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Tel は10桁以上11桁以内の半角数値のみで入力してください')
      end

      it '電話番号が12桁以上' do
        @buy_form.tel = '090-1234-56789'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Tel は10桁以上11桁以内の半角数値のみで入力してください')
      end

      it 'userが紐づいていない' do
        @buy_form.user_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていない' do
        @buy_form.item_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
