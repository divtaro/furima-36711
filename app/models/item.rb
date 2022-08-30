class Item < ApplicationRecord
  validates :item_name,          presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true
  validates :status_id,          presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id,      presence: true
  validates :days_ship_id,       presence: true
  validates :price,              presence: true
  validates :user,               presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank" }
  validates :status_id,          numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,      numericality: { other_than: 1 , message: "can't be blank" }
  validates :days_ship_id,       numericality: { other_than: 1 , message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_ship
end