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
| email_address  | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birthday       | string | null: false |



### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column           | Type       | Options     |
| -----------------| -----------| ----------- |
| product_name     | string     | null: false |
| product_text     | text       | null: false |
| category         | string     | null: false |
| product_condition| string     | null: false |
| shipping_charges | string     | null: false |
| shipping_area    | string     | null: false |
| days_to_ship     | string     | null: false |
| price            | string     | null: false |
| pales_commission | string     | null: false |
| sales_profit     | string     | null: false |
| user_id          | references | null: false, foreign_key: true |

### Association

- has_many :users
- belongs_to :buyer

## buyers テーブル

| Column                 | Type       | Options     |
| -----------------------| -----------| ----------- |
| credit_card_information| string     | null: false |
| expiration_date_month  | string     | null: false |
| expiration_date_year   | string     | null: false |
| security_information   | string     | null: false |
| postal_code            | string     | null: false |
| prefectures_id         | integer    | null: false |
| municipality           | string     | null: false |
| building_name          | string     |             |
| phone_number           | string     | null: false |
| item                   | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user
- belongs_to_active_hash :prefectures