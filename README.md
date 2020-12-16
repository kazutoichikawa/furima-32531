# テーブル設計

## users テーブル
| Column             | Type    | Options     |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| l_name             | string  | null: false |
| f_name             | string  | null: false |
| l_name_r           | string  | null: false |
| f_name_r           | string  | null: false |
| birthday           | date    | null: false |


### Association
- has_many :comments
- has_many :items

## items テーブル
| Column       | Type       | Options     |
|--------------|------------|-------------|
| title        | string     | null: false |
| explain      | text       | null: false |
| category_id  | integer    | null: false |
| condition_id | integer    | null: false |
| s_fee_id     | integer    | null: false |
| area_id      | integer    | null: false |
| days_to_s_id | integer    | null: false |
| user         | references | null: false |

### Association
- has_many :comments
- belongs_to :users

## comments テーブル
| Column    | Type       | Options     |
|-----------|------------|-------------|
| text      | text       | null: false |
| user      | references | null: false |
| item      | references | null: false |

### Association
- belongs_to :items
- belongs_to :users

## purchase_ms テーブル
| Column    | Type       | Options     |
|-----------|------------|-------------|
| c_num     | integer    | null: false |
| ex_m      | integer    | null: false |
| ex_y      | integer    | null: false |
| s_code    | integer    | null: false |
| user      | references | null: false |
| items     | references | null: false |


### Association
has_one :address

## address Tableテーブル
| Column        | Type       | Options     |
|---------------|------------|-------------|
| p_code        | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| building      | string     |             |
| p_num         | integer    | null: false |
| purchase_ms   | references | null: false |

### Association
belongs_to :purchase_ms
