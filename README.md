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
| address               | string     | null: false                                   |
| thanks                | text       | null: false                                   |
| user                  | references | null: false, foreign_key: true                |

### Association

belongs_to :User
belongs_to :Address

## Addresses

| column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| letter_id  | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

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
| blog_text    | text       | null: false                    |
| title        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :User
