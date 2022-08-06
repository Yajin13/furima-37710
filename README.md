# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :address

## items テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| item_name  | string | null: false |
| price      | string | null: false |

### Association

- has_one :users
- has_one :purchase_records

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| date   | string     | null: false                    |

### Association

- belongs_to :item

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false, foreign_key: true |
| address       | string     | null: false, foreign_key: true |
| phone_number  | string     | null: false, foreign_key: true |

### Association

- belongs_to :purchase_records