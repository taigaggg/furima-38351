## itemsテーブル

|Column      |Type   |Options     |
|------------|-------|------------|
|image       |       |null: false |
|item_name   |string |null: false |
|explanation |text   |null: false |
|category    |string |null: false |
|condition   |string |null: false |
|postage     |string |null: false |
|send_area   |string |null: false |
|send_date   |string |null: false |
|price       |integer|null: false |

### Association
has_many :comments
belongs_to :users
has_one :purchases

## commentsテーブル

|Column |Type      |Options                        |
|-------|----------|-------------------------------|
|comment|text      |                               |
|item   |references|null: false, foreign_key: true |
|user   |references|null: false, foreign_key: true |


### Association
belongs_to :items
belongs_to :users


## usersテーブル

|Column            |Type   |Options     |
|------------------|-------|------------|
|nickname          |string |null: false |
|email             |string |null: false |
|encrypted_password|string |null: false |
|name_full         |string |null: false |
|name_kana         |string |null: false |
|date_of_birth     |integer|null: false |


### Association
has_many :comments
has_many :items
has_many :purchases

## purchasesテーブル

|Column|Type      |Options                        |
|------|----------|-------------------------------|
|item  |references|null: false, foreign_key: true |
|user  |references|null: false, foreign_key: true |


### Association
belongs_to :items
has_one :addresses

## addressesテーブル

|Column      |Type   |Options     |
|------------|-------|------------|
|post_code   |integer|null: false |
|prefectures |string |null: false |
|municipality|string |null: false |
|block_number|string |null: false |
|building    |string |null: false |
|phone_number|integer|null: false |


### Association
belongs_to :purchases