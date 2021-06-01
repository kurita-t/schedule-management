# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :plans
- has_many :messages

##  plans テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| site_name        | string     |                   |
| place            | string     |                   |
| period           | integer    |                   |
| meeting_time     | datetime   |                   |
| number_of_people | string     |                   |
| belongings       | text       |                   |
| phone_number     | integer    |                   |
| car              | string     |                   |
| prefecture_id    | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user

## messages テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| note       | text       | null: false       |
| time       | string     | null: false       |
| user       | references | foreign_key: true |

### Association

- belongs_to :user