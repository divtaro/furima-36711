class BuyForm
  include ActiveModel::Model

  attr_accessor :user, :item, :post_code, :prefecture_id, :municipalities, :house_num, :building, :tel, :buy_record
  # buy_recordsテーブルの外部キー(user,item)と、ship_addressesテーブルの外部キー(buy_record)は必要なのか？
  
  # buy_recordsテーブルのバリデーション
  validates :user,           presence: true
  validates :item,           presence: true

  #ship_addressesのバリデーション
  validates :post_code,      presence: true
  validates :prefecture_id,  presence: true
  validates :municipalities, presence: true
  validates :house_num,      presence: true
  validates :building,       presence: true
  validates :tel,            presence: true
  validates :buy_record,     presence: true

  def save
    BuyRecord.create(user: user, item: item)
    ShipAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, house_num: house_num, building: building, tel: tel, buy_record: buy_record )
  end
end