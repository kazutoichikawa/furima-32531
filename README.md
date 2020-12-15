# テーブル設計

## users テーブル
| Column   | Type    | Options     |
|----------|---------|-------------|
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| l_name   | string  | null: false |
| f_name   | string  | null: false |
| l_name_r | string  | null: false |
| f_name_r | string  | null: false |
| birthday   | date | null: false |


### Association
- has_many :comments
- has_many :items

## items テーブル
| Column    | Type       | Options     |
|-----------|------------|-------------|
| title     | string     | null: false |
| explain   | text       | null: false |
| category  | string     | null: false |
| condition | string     | null: false |
| s_fee     | string     | null: false |
| area      | string     | null: false |
| days_to_s | string     | null: false |
| user      | references | null: false |

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