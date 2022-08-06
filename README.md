# テーブル設計

## users テーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| nickname           | string   | null: false                    |
| email              | string   | null: false, foreign_key: true |
| encrypted_password | string   | null: false                    |
| first_name         | string   | null: false                    |
| last_name          | string   | null: false                    |
| birth_date         | integer  | null: false                    |

### Association

- has_many :items
- has_many :address

## items テーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| item_name     | string   | null: false |
| item_explain  | string   | null: false |
| price         | integer  | null: false |

### Association

- has_one :users
- has_one :purchase_records

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false, foreign_key: true |
| prefecture    | string     | null: false, foreign_key: true |
| city          | string     | null: false, foreign_key: true |
| number        | integer    | null: false, foreign_key: true |
| phone_number  | integer    | null: false, foreign_key: true |

### Association

- belongs_to :purchase_records