## itemsテーブル

|Column      |Type      |Options                        |
|------------|----------|-------------------------------|
|item_name   |string    |null: false                    |
|explanation |text      |null: false                    |
|price       |integer   |null: false                    |
|user        |references|null: false, foreign_key: true |
<!-- imageカラムはactive_storage導入時に自動でテーブルなどが生成される -->

<!-- 以下は、Activehashにて実装する
|category_id    |integer |null: false |
|condition_id   |integer |null: false |
|postage_id     |integer |null: false |
|prefecture_id  |integer |null: false |
|send_date_id   |integer |null: false | -->

### Association
has_many :comments
belongs_to :user
has_one :purchase

## commentsテーブル

|Column |Type      |Options                        |
|-------|----------|-------------------------------|
|comment|text      |                               |
|item   |references|null: false, foreign_key: true |
|user   |references|null: false, foreign_key: true |


### Association
belongs_to :item
belongs_to :user

<!-- 注意：コメント機能は追加実装の範囲 -->

## usersテーブル

|Column            |Type   |Options                   |
|------------------|-------|--------------------------|
|nickname          |string |null: false               |
|email             |string |null: false, unique: true |
|encrypted_password|string |null: false               |
|last_name_full    |string |null: false               |
|first_name_full   |string |null: false               |
|last_name_kana    |string |null: false               |
|first_name_kana   |string |null: false               |
|birthday          |date   |null: false               |

<!-- ユーザー管理機能で使用するdeviseの設定で、emailカラムには一意性制約がかかっている為、emailにunique: trueを記載している -->

### Association
has_many :comments
has_many :items
has_many :purchases

## purchasesテーブル

|Column|Type      |Options                        |
|------|----------|-------------------------------|
|item  |references|null: false, foreign_key: true |
|user  |references|null: false, foreign_key: true |

<!-- foreign_key: trueによって、「この商品は誰が購入したものなのか」を紐づけることができる -->

### Association
belongs_to :item
has_one :address
belongs_to :user

## addressesテーブル

|Column      |Type      |Options              |
|------------|----------|---------------------|
|post_code   |string    |null: false          |
|municipality|string    |null: false          |
|block_number|string    |null: false          |
|building    |string    |                     |
|phone_number|string    |null: false          |
|purchase    |references|foreign_key: true   。

<!-- 以下は、Activehashにて実装する
|prefecture_id  |integer |null: false | 
   都道府県                 -->
   
### Association
belongs_to :purchase
