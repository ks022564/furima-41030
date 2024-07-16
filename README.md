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
| first-name         | string   | null: false |
| last-name          | string   | null: false |
| first-name(kana)   | string   | null: false |
| last-name(kana)    | string   | null: false |
| birthday           | datetime | null: false |

## Association
- has_many :items
- has_many :orders

## items テーブル

| Column                        | Type    | Options     |
| ------------------------------| --------| ----------- |
| item-name                     | string  | null: false |
| item-image                    | text    | null: false |
| price                         | integer | null: false |
| category                      | string  | null: false |
| item-condition                | string  | null: false |
| shipping-fee-responsibility   | string  | null: false |
| shipping-origin-area          | string  | null: false |
| estimated-shipping-date       | string  | null: false |
| item-text                     | text    | null: false |
| user                          |reference| foreign_key: true |

## association
- has_one :order
- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------ -| ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| room          | references | null: false, foreign_key: true |
| purchase-date | datetime   | null: false                    |

## association
- belongs_to :user
- belongs_to :item
- has-one :information

## informations テーブル

| Column        | Type       | Options     |
|-------------- | ---------- | ------------|
| postal-code   | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building-name | string     |             |
| phone-number  | string     | null: false |

## association
-belongs_to :order