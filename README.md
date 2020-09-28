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

# テーブル設計
## users テーブル

| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| nick_name      | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birthday       | data   | null: false |



### Association

- has_many :items
- has_many :item_purchases

## items テーブル

| Column              | Type       | Options     |
| --------------------| -----------| ----------- |
| product_name        | string     | null: false |
| product_text        | text       | null: false |
| category_id         | integer    | null: false |
| product_condition_id| integer    | null: false |
| shipping_charges_id | integer    | null: false |
| shipping_area_id    | integer    | null: false |
| days_to_ship_id     | integer    | null: false |
| price               | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :item_purchases
- belongs_to_active_hash :category
- belongs_to_active_hash :product_condition
- belongs_to_active_hash :shipping_charges
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :days_to_ship

## buyers テーブル

| Column                 | Type       | Options     |
| -----------------------| -----------| ----------- |
| postal_code            | string     | null: false |
| prefectures_id         | integer    | null: false |
| municipality           | string     | null: false |
| building_name          | string     |             |
| phone_number           | string     | null: false |
| item_purchase          | references | null: false, foreign_key: true |

- belongs_to :item_purchase
- belongs_to_active_hash :prefectures

## item_purchases テーブル　

| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :buyer