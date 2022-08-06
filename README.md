# テーブル設計

## users テーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| nickname           | string   | null: false                    |
| email              | string   | null: false, unique: true      |
| encrypted_password | string   | null: false                    |
| first_name         | string   | null: false                    |
| last_name          | string   | null: false                    |
| first_kana_name    | string   | null: false                    |
| last_kana_name     | string   | null: false                    |
| birth_date         | date     | null: false                    |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| item_name        | string   | null: false |
| item_explain     | text     | null: false |
| item_category    | string   | null: false |
| item_condition   | string   | null: false |
| delivery_charge  | string   | null: false |
| delivery_area    | string   | null: false |
| delivery_days    | string   | null: false |
| price            | integer  | null: false |

### Association

- has_many :users
- has_one :purchase_record

## purchase_record テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false, foreign_key: true |
| prefecture_id | integer    | null: false, foreign_key: true |
| city          | string     | null: false, foreign_key: true |
| number        | string     | null: false, foreign_key: true |
| building_name | string     |                                |
| phone_number  | string     | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record