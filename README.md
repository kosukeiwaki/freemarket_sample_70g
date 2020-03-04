# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|firstname|integer|null: false|
|lastname|string|null: false|
|birthday|string|null: false|
|zip|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|
|building|string|
|phone_number|integer|


### Association
- has_many :comments
- has_many :items
- belongs_to :like



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|size|string|null: false|
|brand|string|
|status|string|
|fee|integer|null: false|
|resion|string|null: false|
|shipping_date|string|null: false|


|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :like
- has_many :images
- has_many :comments
- has_many :items_categorys
- has_many :categorys, through:  :items_categorys 



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item



## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|item_category_id|integer|null: false, foreign_key: true|

### Association
- has_many :items_categorys
- belongs_to :items, through:  :items_categorys



## items_categorysテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :group
- belongs_to :user



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|


### Association
- has_many :users
- has_many :items



## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
