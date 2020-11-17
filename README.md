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

