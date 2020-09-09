# README

<!-- This README would normally document whatever steps are necessary to get the
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

# 日本語

[![Image from Gyazo](ここに画像)]()   -->

このアプリは、気の合う人と知り合う為の女性専用マッチングアプリです。

## 概要

”女性専用の SNS 型マッチングアプリ”です。<br />
※私自身が下記の様な思いがあり、このアプリを作ろうと思いました。<br />

1,毎日教室で顔を合わせて自然に友達になっていた学生時代とは違い、社会人になると新たな友達をつくることも予定を合わせることも難しくなった…<br />
2,同じ状況の色んな人と話して価値観を広げたい。子育ての悩み、結婚生活の悩み、普段生活している中では出会えない様な気の会う人と出会いたい。など<br >
3,結婚、出産、子育て、夫の転勤などでライフチェンジが多く環境の変化などで今までのように都合が合わず会えなくなった…<br />
4,子育て中に、子供を連れて外に出るのは大変、女子会もランチしか行けないので仕事をしている友達とは予定が合わなくなった。<br />
5,生活スタイルが違くなったので「今日飲みに行こう！」って気軽に誘えなくなった。
<br>
Ruby、Ruby on Rails、jQuery、MySQL で書かれています。<br>
<br>  
このアプリには、ログイン/ログアウト機能、投稿一覧ページ、写真投稿機能、投稿削除機能、コメント機能、グループトーク機能、ユーザーマイページ、タグ機能があります。

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

<!-- ## 特徴


### あなたのタイムラインには、あなたがフォローしているユーザーの投稿のみを表示します。

[![Image from Gyazo](※)](※)
<br />
<br />



### トップバーにある検索ボックスから、世界中のユーザーを検索することが出来て<br />ユーザページからワンクリックでユーザーをフォローすることができます。

[![Image from Gyazo]()]()

<br /> -->

<!-- ### いいねした投稿ページでは、そのユーザーがどんな投稿をいいねしているのか見ることができます。

[![Image from Gyazo]()]()
<br />
<br /> -->

### 投稿の詳細ページから、コメントを残すことが可能です。

![comment651ea4f5248f3596571c323473bdc4af](https://user-images.githubusercontent.com/66055547/92558432-75532700-f2a9-11ea-91c3-3bebbf7193ef.gif)

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

- 多対多のアソシエーションを作成し、コメント機能を実装
- マイページには、自分が過去に投稿した写真達が一覧で見やすく表示
- 非同期通信でコメント機能、いいね機能を実装

## 課題や今後実装したい機能

- タイムラインに、あなたがフォローしているユーザーの投稿のみを表示
- 画像を複数枚投稿する
- 動画を投稿できるようにする
- 通知機能をつける
- 架空のフォロークラス、フォロワークラスを使い、フォロー機能を実装
- インクリメンタルサーチでのユーザー検索機能を実装
- 投稿する画像を確認するために、プレビュー機能を実装

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

# English

[![Image from Gyazo]()]()  
This app is a female-only matching app for getting to know people you like.

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

-Create many-to-many association and implement comment function
-My page shows photos posted by me in the past in an easy-to-see list
-Implemented comment function and like function by asynchronous communication

## Issues and features you want to implement in the future

-Show only posts by users you follow in the timeline
-Post multiple images
-Enable posting videos
-Turn on notification function
-Implement follow function using fictitious follow class and follower class
-Implemented user search function in incremental search
-Implemented a preview function to confirm the image to be posted

## Development Environment

Ruby 2.6.5  
Rails 6.0.3.2  
MySQL 14.14  
jQuery 1.12.4

## Production environment

Saln is deployed on AWS  
IP：あとで実装

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
