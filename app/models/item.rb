class Item < ApplicationRecord
  # ** : 記録のために残す部分

  # **バリデーション
  validates :item_name,          presence: true, length: { maximum: 40 }
  validates :description,        presence: true, length: { maximum: 1000 }
  validates :category_id,        presence: true
  validates :status_id,          presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id,      presence: true
  validates :days_ship_id,       presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # ** ↓userに対してはアソシエーションを組んでいるため、バリデーションは不要（）
  # ** validates :user,               presence: true
  validates :image,              presence: true

  # ** ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :days_ship_id,       numericality: { other_than: 1, message: "can't be blank" }

  # ** アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_ship
  # ** ↓userとのアソシエーションを組まないと、どのユーザーが出品するのかが判らないため、出品データを保存できない。
  belongs_to :user
  has_one_attached :image
end
