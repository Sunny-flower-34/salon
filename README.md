# README

<!--
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
<!--  -->

# 日本語

このアプリは、気の合う人と知り合う為の女性専用マッチングアプリです。

## 概要

”女性専用の SNS 型マッチングアプリ”です。<br />
※私自身が下記の様な思いがあり、このアプリを作ろうと思いました。<br />
<br />
1、毎日教室で顔を合わせて自然に友達になっていた学生時代とは違い、社会人になると家と職場の往復のみで新たな友達をつくることも予定を合わせることも難しくなった…<br />
2、同じ状況の色んな人と話して価値観を広げたい。子育ての悩み、結婚生活の悩み、普段生活している中では出会えない様な気の会う人と知り合いたい。<br >
3、学生時代の友達とは結婚、出産、子育て、夫の転勤などでライフチェンジによる環境の変化などで今までのように都合が合わず会えなくなった…<br />
4、子育て中に、子供を連れて外に出るのは大変、女子会もランチしか行けないので仕事をしている友達とは予定が合わなくなった。<br />
5、生活スタイルが違くなったので「今日飲みに行こう！」って気軽に誘えなくなった。<br />
<br />

Ruby、Ruby on Rails、Scss、jQuery、MySQL で書かれています。  
【機能】<br>
このアプリには、ログイン/ログアウト機能、投稿一覧ページ、写真投稿機能、投稿削除機能、コメント機能、グループトーク機能、ユーザーマイページ、ユーザーへのタグ機能があります。

## 開発環境

Ruby 2.6.5  
Rails 6.0.3.2  
MySQL 14.14  
jQuery 1.12.4

## 本番環境

<!-- AWS を用いてデプロイ済み。   -->
<!-- IP：※あとでURL記述 -->

## 特徴

### ログイン機能／ログインするとマイページに行きます。

![c211d9aff5750d3b6a64106386beb832](https://user-images.githubusercontent.com/66055547/92346674-684b0200-f108-11ea-81dd-e8d5c4b98249.gif)

<br />
<br />

### マイページには、あなたが過去に投稿した写真達が一覧で見やすく表示されています。

![usershow8ed89f9ab21f1ce7536e424753](https://user-images.githubusercontent.com/66055547/92578753-421f9080-f2c7-11ea-87a6-44435061a547.gif)

<br />
<br />

### グループトーク機能でメッセージを送って、アプリ内でコミニケーションが取れます。

![344ed4a27a2c2aaeb5fc6a7c0ce88301](https://user-images.githubusercontent.com/66055547/93574807-d5e21280-f9d3-11ea-9978-ffd81073199c.gif)

<br />
<br />

<!-- ## 特徴
### あなたのタイムラインには、あなたがフォローしているユーザーの投稿のみを表示します。

[![Image from Gyazo](※)](※)



### トップバーにある検索ボックスから、世界中のユーザーを検索することが出来て<br />ユーザページからワンクリックでユーザーをフォローすることができます。

[![Image from Gyazo]()]()

<br /> -->

<!-- ### いいねした投稿ページでは、そのユーザーがどんな投稿をいいねしているのか見ることができます。

[![Image from Gyazo]()]()
<br />
<br /> -->

### 投稿の詳細ページから、コメントを残すことが可能です。

![commentef251b87bb2801373b860a4ebdb8f23e](https://user-images.githubusercontent.com/66055547/92714517-474c1080-f397-11ea-8c0d-0c9acc363ecf.gif)

<br />
<br />

### 各種タグをクリックするとそのタグをつけているユーザーの一覧が表示されます。

![Tag33702b70103de12e62790b7173e378e4](https://user-images.githubusercontent.com/66055547/92470010-c2cf8580-f210-11ea-9d51-973f0446f678.gif)

<br />
<br />

<!-- ## テスト方法

- ログインアカウント
  メールアドレス：m78.omori.haruka@gmail.com
  パスワード：※あとで記述 -->

## 工夫したポイント

- グループトーク機能を実装しメッセージを非同期で送信
- 多対多のアソシエーションを作成し、コメント機能を実装
- マイページには、自分が過去に投稿した写真達が一覧で見やすく表示
- 投稿の詳細ページから、コメントを残すことが可能
- 各種タグをクリックするとそのタグをつけているユーザーの一覧が表示
<!-- - 非同期通信でコメント機能、いいね機能を実装 -->

## 課題や今後実装したい機能

- イベント機能の実装をし、ユーザーがイベントを開催 → 参加希望と参加許可機能を実装
- インクリメンタルサーチでのユーザー検索機能を実装
- タイムラインに、あなたがフォローしているユーザーの投稿のみを表示
- 画像を複数枚投稿する
- 動画を投稿できるようにする
- 投稿する画像を確認するために、プレビュー機能を非同期で実装
- 通知機能をつける
- 架空のフォロークラス、フォロワークラスを使い、フォロー機能を実装

## 著者

大森 晴華（おおもり はるか） <br>
E-Mail: m78.omori.haruka@gmail.com
<br />
<br />

# DB 設計

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
- has_many :comments
- has_many :tag-users
- has_many :tags, through: :tag-users
- has_many :room-users
- has_many :rooms, through: :room-users

## posts テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| title   | string  |
| body    | text    | null: false                    |
| image   | string  |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :comment

## comments テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| post_id         | integer | null: false, foreign_key: true |
| comment_content | text    | null: false                    |

### Association

- belongs_to :user
- belongs_to :post

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

## room-users テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| room_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## rooms テーブル

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| tag_name | string | null: false, foreign_key: true |

### Association

- has_many :room-users
- has_many :rooms, through: :room-users

## messages テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| room_id | integer | null: false, foreign_key: true |
| content | text    | null: false                    |

### Association

- belongs_to :user
- belongs_to :room

# English

<!-- [![Image from Gyazo]()]()
This app is a female-only matching app for getting to know people you like. --> -->

## Description

"SNS type matching app for women only". <br />
I myself have the following thoughts and decided to make this app. <br />

1 Unlike the days when I was a student who met face-to-face in the classroom every day and became friends naturally, becoming a member of society made it difficult to make new friends and make appointments.<br />
2 I want to talk to various people in the same situation and broaden my sense of values. I want to meet people I have concerns about raising children, marriages, and things that I can't meet in my normal life. <br>
3 Marriage, childbirth, child rearing, husband's transfer, etc. caused many life changes, and due to changes in the environment etc. I could not meet because it was not convenient for me...
4 While raising a child, it was difficult to go outside with my child, and the girls' association could only go to lunch, so I couldn't keep up with my working friends. <br />
5 My lifestyle has changed, so I can't easily invite me to go for a drink today!
Written in Ruby, Ruby on Rails, jQuery, MySQL.
This app has login/logout function, post list page, photo posting function, post deletion function, comment function, group talk function,
There is a post page you like, a user page, and a tag function.

<!-- ## Features / Demo -->

## Point devised

-Implemented group talk function to send messages asynchronously
-Create many-to-many associations and implement commenting
-On My Page, the photos you posted in the past are displayed in a list for easy viewing.
-You can leave a comment from the post details page
-Click various tags to display a list of users with those tags

## Issues and features you want to implement in the future

--Implemented the event function and the user holds the event → Implemented the participation request and participation permission function
--Implemented user search function in incremental search
--Show only posts of users you follow on the timeline
--Post multiple images
--Allows you to post videos
--Implemented preview function asynchronously to check the image to be posted
--Add notification function
--Implemented follow function using fictitious follow class and follower class

## Development Environment

Ruby 2.6.5  
Rails 6.0.3.2  
MySQL 14.14  
jQuery 1.12.4

<!-- ## Production environment

Saln is deployed on AWS
IP：あとで実装 -->

<!-- ## Test

- Login Account
  e-mail：m78.omori.haruka@gmail.com
  password： -->

## Author

Haruka Oomori  
Mail to: m78.omori.haruka@gmail.com
<br />
<br />
<br />
