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
|firstname|string|null: false|
|lastname|string|null: false|
|birthday|string|null: false|
|adress_id|integer|null: false, foreign_key: true|


### Association
- has_many :comments
- has_many :items
- has_many :likes
- belongs_to :adress


## adressesテーブル

|Column|Type|Options|
|------|----|-------|
|zip|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|
|building|string|
|phone_number|integer|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|price|integer|null: false|
|size|string|null: false|
|brand|string|
|status|string|null: false|
|fee|integer|null: false|
|resion|string|null: false|
|shipping_date|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :likes
- has_many :images
- has_many :comments
- has_many :items_categories
- has_many :categories, through:  :items_categories 



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item



## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|item_category_id|integer|null: false, foreign_key: true|

### Association
- has_many :items_categories
- has_many :items, through:  :items_categories



## items_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :item
- belongs_to :category



## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item



## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
