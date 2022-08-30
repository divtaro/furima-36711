class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.string     :description,        null: false
      t.string     :category_id,        null: false
      t.string     :status_id,          null: false
      t.string     :delivery_charge_id, null: false
      t.string     :prefecture_id,      null: false
      t.string     :days_ship_id,       null: false
      t.string     :price,              null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
