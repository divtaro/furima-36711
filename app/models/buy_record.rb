class BuyRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :ship_address
end
