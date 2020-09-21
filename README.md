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
| Nick Name      | string | null: false |
| Email Address  | string | null: false |
| Password       | string | null: false |
| Last Name      | string | null: false |
| First Name     | string | null: false |
| Last Name KANA | string | null: false |
| First Name KANA| string | null: false |
| Birthday year  | string | null: false |
| Birthday month | string | null: false |
| Birthday day   | string | null: false |


### Association

- has_many :items

## items テーブル

| Column           | Type       | Options     |
| -----------------| -----------| ----------- |
| Pictre           | string     | null: false |
| Product Name     | string     | null: false |
| Product text     | string     | null: false |
| Category         | string     | null: false |
| Product condition| string     | null: false |
| Shipping charges | string     | null: false |
| Shipping area    | string     | null: false |
| Days to ship     | string     | null: false |
| Price            | string     | null: false |
| Sales commission | string     | null: false |
| Sales profit     | string     | null: false |
| user_id          | references | null: false, foreign_key: true |

### Association

- has_many :users
- belongs_to :buyer

## buyer テーブル

| Column                 | Type       | Options     |
| -----------------------| -----------| ----------- |
| Credit card information| string     | null: false |
| Expiration date month  | string     | null: false |
| Expiration date year   | string     | null: false |
| Security information   | string     | null: false |
| Postal code            | string     | null: false |
| Prefectures            | string     | null: false |
| Municipality           | string     | null: false |
| Building name          | string     | null: false |
| Phone number           | string     | null: false |
| item_id                | references | null: false, foreign_key: true |

- belongs_to :items