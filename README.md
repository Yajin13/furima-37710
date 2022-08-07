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

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_explain        | text       | null: false                    |
| item_category_id    | integer    | null: false                    |
| item_condition_id   | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| delivery_day _id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- has_many :user
- has_one :purchase_record

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| number           | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_record  | references | foreign_key: true              |

### Association

- belongs_to :purchase_record