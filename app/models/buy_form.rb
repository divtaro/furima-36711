class BuyForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :house_num, :building, :tel, :buy_record_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :house_num
    validates :tel
    validates :buy_record_id
  end
  validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }

  def save
    buy_record = BuyRecord.create(user_id: user_id, item_id: item_id)
    ShipAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, house_num: house_num, building: building, tel: tel, buy_record_id: buy_record.id)
  end 
end