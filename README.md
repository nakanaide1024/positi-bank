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

## Letters

| column                | Type       | Options                                       |
| --------------------- | ---------- | --------------------------------------------- |
| thanks                | text       | null: false                                   |
| user                  | references | null: false, foreign_key: true                |

### Association

belongs_to :User
belongs_to :Address

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
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :User

## Blogs

| column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    |
| title        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :User
