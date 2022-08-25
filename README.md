# テーブル設計

## users テーブル

| Column             | Type    | Options                            |
| ------------------ | ------- | ---------------------------------- |
| nickname           | string  | null: false,                       |
| email              | string  | null: false, unique: true          |
| encrypted_password | string  | null: false                        |
| last_name          | string  | null: false                        |
| first_name         | string  | null: false                        |
| last_name_kana     | string  | null: false                        |
| first_name_kana    | string  | null: false                        |
| date_birth         | date    | null: false                        |

### Association

-has_many :items
-has_many :buy_records

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| item_name          | string      | null: false                    | 
| description        | text        | null: false                    | 
| category_id        | integer     | null: false                    | 
| status_id          | integer     | null: false                    | 
| delivery_charge_id | integer     | null: false                    | 
| prefecture_id      | integer     | null: false                    | 
| days_ship_id       | integer     | null: false                    | 
| price              | integer     | null: false                    | 
| user               | references  | null: false, foreign_key: true | 

### Association

-belongs_to :user
-has_one    :buy_record

## buy_recordsテーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| item               | references  | null: false, foreign_key: true | 
| user               | references  | null: false, foreign_key: true | 

### Association

-belongs_to :item
-belongs_to :user
-has_one    :ship_address

## ship_addresses テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| post_code          | string      | null: false                    |
| prefecture_id      | integer     | null: false                    | 
| municipalities     | string      | null: false                    |
| house_num          | string      | null: false                    |
| building           | string      |                                |
| tel                | string      | null: false                    | 
| buy_record         | references  | null: false, foreign_key: true | 

### Association

-belongs_to :buy_record