# README

# テーブル設計

## Usersテーブル

| column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |

### Association

- has_many :Letters
- has_many :Addresses
- has_many :Posits
- has_many :Blogs
- has_many :Likes
- has_many :Profiles
- has_many :Blogs_likes

## Letters

| column                | Type       | Options                                       |
| --------------------- | ---------- | --------------------------------------------- |
| thanks                | text       | null: false                                   |
| user                  | references | null: false, foreign_key: true                |

### Association

- belongs_to :User
- has_one :Address

## Addresses

| column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| letter     | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :Letter
- belongs_to :User

## Posits

| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| posit   | string     | null: false                    |
| checked | boolean    |                                |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- has_many :Likes

## Blogs

| column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| title        | string     | null: false                    |
| checked      | boolean    |                                |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- has_many :Likes

## Profiles

| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| profile | string     |                                |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :User

## Addresses

| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| letter  | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- belongs_to :Letter

## Likes

| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| posit   | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- belongs_to :Posit

## BlogsLikes

| column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| blog    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- belongs_to :Blog

■アプリURL<br>

## テスト用ログイン
- メールアドレス：recruit@sample.com
- パスワード：password

# アプリケーションの概要
- ポジティブな情報が集まるサイト。
- 見つけた小さな幸せや感動したこと等を呟きやブログで発信。
- 自分の投稿にステキボタンが押されたり、他ユーザーの投稿にステキボタンを押すと、その総数が"縁"という単位で可視化できる。
- 感謝状機能でステキな投稿をした人にメッセージが送れる。

# アプリケーションの機能
- ログイン / ログアウト機能
- 呟き投稿
- ブログ投稿
- 画像投稿
- ステキ機能
- 感謝状機能
- 縁加算機能
- プロフィール機能
- ニュース、動画閲覧機能

# 制作背景
SNSやニュースサイトでは思いがけずネガティブな情報や悪意のあるコメントのやりとりなどを目にしてしまうことが多い。
それによって気持ちが沈んだり、ネガティブな感情に引っ張られてしまう経験から、ポジティブな情報だけが集まったサイトがあったら面白いのではないかと考え制作した。

# 使用した技術（開発環境）
## フレームワーク
- Ruby on Rails 6.3.0.4
## データベース
- MYSQL

# 今後解決したい課題
- デザインをもっと拘りたい
- テストコードを充実させたい。
- フォロー機能を追加しフォローしたユーザーの情報をしマイページで閲覧できるようにしたい。
- ブログと呟き機能にリンクや絵文字が使えたり、リツイートなど拡張機能を加えたい。
- javascriptを駆使し、ストレスの少ない使い心地にしたい。
