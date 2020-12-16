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
| buy_user  | integer    | null: false |
| user      | references | null: false |
| items     | references | null: false |

### Association
has_one :s_address_m

## s_address_ms Tableテーブル
| Column    | Type       | Options     |
|-----------|------------|-------------|
| address   | text       | null: false |
| user      | references | null: false |
| items     | references | null: false |

### Association
has_one :purchase_ms
