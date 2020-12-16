# テーブル設計

## users テーブル
| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| l_name             | string  | null: false               |
| f_name             | string  | null: false               |
| l_name_r           | string  | null: false               |
| f_name_r           | string  | null: false               |
| birthday           | date    | null: false               |


### Association
- has_many :comments
- has_many :items
- has_many :purchase_ms

## items テーブル
| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| title        | string     | null: false                    |
| explain      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| s_fee_id     | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| days_to_s_id | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user
- has_one :purchase_m

## comments テーブル
| Column    | Type       | Options                         |
|-----------|------------|---------------------------------|
| text      | text       | null: false                     |
| user      | references | null: false, foreign_key: true  |
| item      | references | null: false, foreign_key: true  |

### Association
- belongs_to :item
- belongs_to :user

## purchase_ms テーブル
| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address Tableテーブル
| Column        | Type       | Options                       |
|---------------|------------|-------------------------------|
| p_code        | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building      | string     |                               |
| p_num         | string     | null: false                   |
| purchase_m    | references | null: false,foreign_key: true |

### Association
- belongs_to :purchase_m
