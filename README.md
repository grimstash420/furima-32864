# テーブル設計

## users テーブル

| Colum      | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| birth_day  | date   | null: false |

### Association

- has_many :products
- belongs_to :destination
- belongs_to :card




## products テーブル

| Colum         | Type   | Options     |
| ------------- | ------ | ----------- |
| image         | string | null: false |
| name          | string | null: false |
| description   | string | null: false |
| category      | string | null: false |
| status        | string | null: false |
| shipping_cost | string | null: false |
| prefecture    | string | null: false |
| shipping_days | string | null: false |
| price         | string | null: false |

### Association

- belongs_to :user


## destinations テーブル

| Colum         | Type   | Options     |
| ------------- | ------ | ----------- |
| postcode      | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| address       | string | null: false |
| building_name | string | null: false |
| phone_number  | string | null: false |

### Association

- belongs_to :user

## cards テーブル

| Colum         | Type    | Options     |
| ------------- | ------- | ----------- |
| user_id       | integer | null: false |
| customer_id   | string  | null: false |
| card_id       | string  | null: false |

### Association

- belongs_to :user