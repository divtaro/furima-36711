# require 'rails_helper'

# RSpec.describe ShipAddress, type: :model do
#   before do
#     @ship_address = FactoryBot.build(:ship_address)
#     @buy_record =FactoryBot.build(:buy_record)
#   end

#   describe '発送先データ登録' do
#     context '発送先データを登録できる場合' do
#       it '郵便番号が存在すれば登録できる' do
#         expect(@ship_address).to be_valid
#       end

#       it '郵便番号が「3桁ハイフン4桁」の半角文字列であれば登録できる' do
#         post_code = '123-4567'
#         expect(@ship_address).to be_valid
#       end

#       it '都道府県が存在すれば登録できる' do
#         prefecture_id  = '2'
#         expect(@ship_address).to be_valid
#       end

#       it '市区町村が存在すれば登録できる' do
#         municipalities  = '名古屋市'
#         expect(@ship_address).to be_valid
#       end

#       it '番地が存在すれば登録できる' do
#         house_num  = '1-1-1'
#         expect(@ship_address).to be_valid
#       end

#       it '建物名が存在しなくても登録できる' do
#         building  = ''
#         expect(@ship_address).to be_valid
#       end

#       it '電話番号が存在すれば登録できる' do
#         tel  = '09012345678'
#         expect(@ship_address).to be_valid
#       end

#       it '電話番号が10桁以上11桁以内の半角数値であれば登録できる' do
#         tel  = '09012345678'
#         expect(@ship_address).to be_valid
#       end
#     end

#     context '発送先を登録できない場合' do
#       it '郵便番号が存在しなければ登録できない' do
#         @ship_address.post_code = ''
#         @ship_address.valid?
#         expect(@ship_address.errors.full_messages).to include("")
#       end  
      
#       it '郵便番号に「ハイフン」がなければ登録できない' do
#         @ship_address.post_code = '1234567'
#         @ship_address.valid?
#       end

#       it '郵便番号の「ハイフン」前後の桁数が合っていないと登録できない' do
#         @ship_address.post_code = '1234-567'
#         @ship_address.valid?
#       end

#       it '郵便番号が全角数字の場合は登録できない' do
#         @ship_address.post_code = '１２３４-５６７'
#         @ship_address.valid?
#       end

#       it '都道府県が存在しなければ登録できない' do
#         @ship_address.prefecture_id = ''
#         @ship_address.valid?
#       end

#       it '市区町村が存在しなければ登録できない' do
#         @ship_address.municipalities = ''
#         @ship_address.valid?
#       end

#       it '番地が存在しなければ登録できない' do
#         @ship_address.house_num = ''
#         @ship_address.valid?
#       end

#       it '電話番号が存在しなければ登録できない' do
#         @ship_address.tel = ''
#         @ship_address.valid?
#       end

#       it '電話番号の桁数が合っていなければ登録できない' do
#         @ship_address.tel = '0901234567'
#         @ship_address.valid?
#       end

#       it '電話番号が半角数字でなければ登録できない' do
#         @ship_address.tel = '０９０１２３４５６７８'
#         @ship_address.valid?
#       end

#       it '電話番号に「ハイフン」が入っていると登録できない' do
#         @ship_address.tel = '090-1234-5678'
#         @ship_address.valid?
#       end
#     end
#   end
# end