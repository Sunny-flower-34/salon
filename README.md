# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| username      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| profile       | text   | null: false |
| profile_image | string |

### Association

- has_many :posts
- has_many :tag-users
- has_many :tags, through: :tag-users

## posts テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| title   | string  |
| body    | text    | null: false                    |
| image   | string  |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

## tag-users テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| tag_id  | integer | null: false, foreign_key: true |

### Association

- belongs_to :tag
- belongs_to :user

## tags テーブル

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| tag_name | string | null: false, foreign_key: true |

### Association

- has_many :tag-users
- has_many :users, through: :tag-users
