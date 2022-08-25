# テーブル設計

## users テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| nickname           | string  | null: false, foreign_key: true |
| email              | string  | null: false, unique: true      |
| password           | string  | null: false                    |
| user_name          | string  | null: false                    |
| kana_name          | string  | null: false                    |
| date_birth         | boolean | null: false                    |

### Association

-has_many :items
-has_many :buyers

## items テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| seller             | string  | null: false, foreign_key: true | 
| item_name          | string  | null: false, foreign_key: true | 
| description        | text    | null: false, foreign_key: true | 
| category           | boolean | null: false, foreign_key: true | 
| status             | boolean | null: false, foreign_key: true | 
| delivery_charge    | boolean | null: false, foreign_key: true | 
| sender_area        | boolean | null: false, foreign_key: true | 
| days_ship          | boolean | null: false, foreign_key: true | 
| price              | integer | null: false, foreign_key: true | 
| commission         | integer | null: false, foreign_key: true | 
| profit             | integer | null: false, foreign_key: true | 

### Association

-belongs_to :users
-has_one :buyers

## buyers テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| buyer              | string  | null: false, foreign_key: true | 
| buy_item           | string  | null: false, foreign_key: true | 

### Association

-belongs_to :items
-belongs_to :users
-belongs_to :ship_addresses

## ship_addresses テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| post_code          | integer | null: false, foreign_key: true | 
| prefecture         | boolean | null: false, foreign_key: true |
| municipalities     | string  | null: false, foreign_key: true |
| house_num          | string  | null: false, foreign_key: true |
| building           | string  |              foreign_key: true |
| tel                | integer | null: false, foreign_key: true | 

### Association

-has_many :buyers