class ShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table   :ship_addresses do |t|
      t.string     :post_code,       null: false
      t.integer    :prefecture_id,   null: false
      t.string     :municipalities,  null: false
      t.string     :house_num,       null: false
      t.string     :building        
      t.string     :tel,             null: false
      t.references :buy_record,      null: false, foreign_key: true 
      t.timestamps
    end
  end
end