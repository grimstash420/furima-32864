# テーブル設計

## users テーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :products
- belongs_to :card




## products テーブル

| Colum            | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| description      | string  | null: false |
| category_id      | integer | null: false |
| status_id        | integer | null: false |
| shipping_cost_id | integer | null: false |
| prefecture_id    | integer | null: false |
| shipping_days_id | integer | null: false |
| price            | integer | null: false |
| user_id          | integer | null: false | 

### Association

- belongs_to :user


## destinations テーブル

| Colum         | Type    | Options     |
| ------------- | ------- | ----------- |
| postcode      | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  | null: false |
| phone_number  | string  | null: false |

### Association

- belongs_to :user

