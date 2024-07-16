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

| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| first_name_kana    | string   | null: false |
| last_name_kana     | string   | null: false |
| birthday           | date     | null: false |

## Association
- has_many :items
- has_many :orders

## items テーブル

| Column                        | Type       | Options     |
| ----------------------------- | ---------- | ----------- |
| item_name                     | string     | null: false |
| price                         | integer    | null: false |
| category_id                   | integer    | null: false |
| item_condition_id             | integer    | null: false |
| shipping_fee_responsibility_id| integer    | null: false |
| prefecture_id                 | integer    | null: false |
| estimated_shipping_date_id    | integer    | null: false |
| item_text                     | text       | null: false |
| user                          | references | null: false, foreign_key: true |

## association
- has_one :order
- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

## association
- belongs_to :user
- belongs_to :item
- has-one :information

## informations テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| order         | references | null: false, foreign_key:true |

## association
- belongs_to :order