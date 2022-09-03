class ShipAddress < ApplicationRecord
  #buy_recordテーブルとのアソシエーション
  belongs_to :buy_record
end