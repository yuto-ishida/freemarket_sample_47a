# README
## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|
|user_id|references|null: false, foreign_key: true|
|category_parent_id|references|foreign_key: true|
|category_child_id|references|foreign_key: true|
|category_grandchild_id|references|foreign_key: true|
|item_image_id|references|foregin_key: true|
|brand_id|references|foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|item_size_id|references|foreign_key: true|
|shipping_burden_id|references|foreign_key: true|
|shipping_style_id|references|null: false, foreign_key: true|
|date_of_shipment_id|references|null: false, foreign_key: true|
|price|integer|null: false|
|credit_id|references|foreign_key: true|
|status_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category_parent
- belongs_to :category_child
- belongs_to :category_grandchild
- belongs_to :item_image
- belongs_to :brand
- belongs_to :condition
- belongs_to :shipping_burden
- belongs_to :shipping_style
- belongs_to :date_of_shipment
- belongs_to :credit
- belongs_to :buyer
- belongs_to :item_size
- belongs_to :status
- has_many :messages, :dependent => :destroy
- has_many :points
- has_many :evaluations
- has_many :likes, :dependent => :destroy

## Informationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|text|text|

### Association
- belongs_to :user
- belongs_to :item

## Pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|value|integer|

### Association
- belongs_to :user
- belongs_to :item

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|parent|integer|

### Association
- has_many :items

## Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|
|main|integer|

### Association
- belongs_to :items

## Conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## Item_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|parent|integer|

### Association
- has_many :items

## statusテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## Shipping_burdensテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## Shipping_stylesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## Date_of_shipmentsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unipue: true|
|pasword|string|null: false|

### Association
- has_many :items, :dependent => :destroy
- has_many :credits, :dependent => :destroy
- has_many :contact_informations, :dependent => :destroy
- has_many :informations
- has_many :points, :dependent => :destroy
- has_many :evaluations
- has_many :likes
- has_many :messages
- belongs_to :buyer
- belongs_to :item, through: :buyers

## Messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :item
- belongs_to :user

## Creditsテーブル
#payjp 実装時に再考
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|card_number|integer|null: false|
|expiration_date_year|integer|null: false|
|expiration_date_month|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user

## Evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|satisfaction|integer|null: false|

### Association
- belongs_to :user
- belongs_to :item
- evaluator

## Evaluatorテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|evaluation_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :evaluation

## Contact_informationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|person_exhibit|integer|
|nickname|string|
|self_introduction|text|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|date|
|address_number|string|
|prefecture|
|city|string|
|address|string|
|building_name|string|
|phone_number|integer|

### Association
- belongs_to :user

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## Newsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|

## Buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user_id
- belongs_to :item_id

