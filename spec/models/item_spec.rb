require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/furima-intro01.png')
  end

  describe '商品出品データ登録' do
    context '商品を出品できる場合' do
      it 'item_nameが1文字ならば出品できる' do
        item_name = 'a'
        expect(@item).to be_valid
      end

      it 'item_nameが40文字ならば出品できる' do
        item_name = 'a' * 40
        expect(@item).to be_valid
      end

      it 'descriptionが1文字ならば出品できる' do
        description = 'a'
        expect(@item).to be_valid
      end

      it 'descriptionが1000文字ならば出品できる' do
        description = 'a' * 1000
        expect(@item).to be_valid
      end

      it 'category_idが2ならば出品できる' do
        category_id = 2
        expect(@item).to be_valid
      end

      it 'category_idが11ならば出品できる' do
        category_id = 11
        expect(@item).to be_valid
      end

      it 'status_idが2ならば出品できる' do
        status_id = 2
        expect(@item).to be_valid
      end

      it 'status_idが7ならば出品できる' do
        status_id = 7
        expect(@item).to be_valid
      end

      it 'delivery_charge_idが2ならば出品できる' do
        delivery_charge_id = 2
        expect(@item).to be_valid
      end

      it 'delivery_charge_idが3ならば出品できる' do
        delivery_charge_id = 3
        expect(@item).to be_valid
      end

      it 'prefecture_idが2ならば出品できる' do
        prefecture_id = 2
        expect(@item).to be_valid
      end

      it 'prefecture_idが48ならば出品できる' do
        prefecture_id = 48
        expect(@item).to be_valid
      end

      it 'days_ship_idが2ならば出品できる' do
        days_ship_id = 2
        expect(@item).to be_valid
      end

      it 'days_ship_idが4ならば出品できる' do
        days_ship_id = 4
        expect(@item).to be_valid
      end

      it 'priceが300（半角）ならば出品できる' do
        price = 300
        expect(@item).to be_valid
      end

      it 'priceが9999999（半角）ならば出品できる' do
        price = 9_999_999
        expect(@item).to be_valid
      end

      it 'imageが存在していれば出品できる' do
        image = fixture_file_upload('app/assets/images/furima-intro01.png')
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない場合' do
      it 'item_nameが存在しなければ出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_nameが41文字では出品できない' do
        @item.item_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end

      it 'descriptionが存在しなければ出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'descriptionが1001文字では出品できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが1では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'delivery_charge_idが1では出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'days_ship_idが1では出品できない' do
        @item.days_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship can't be blank")
      end

      it 'priceが存在しなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end

      it 'priceが299円では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが10000000円では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが全角英数字では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが数字以外では出品できない' do
        @item.price = '山田ヤマダやまだＹＡＭＡＤＡ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'imageが存在しなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
