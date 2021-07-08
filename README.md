# アプリ名

SCHEDULE-MANAGEMENT

# 概要

 ユーザーを登録することにより、仕事などの予定をカレンダーで管理することが出来ます。  
 また、連絡先の分からない作業員に連絡が出来るようにチャット機能もあります。  
 ユーザーを登録しないと予定の追加やチャットの書き込みは出来ませんが、投稿された予定やチャットを見ることは出来ます。


# 本番環境

https://schedule-management-33062.herokuapp.com/

ログイン情報（テスト用）

・Eメール：sample10@sample.com  
・パスワード：123456

# 制作背景(意図)


# DEMO

 1. 左上のメニューボタンを押すと各項目が出てくるので『新規登録』を選択してユーザー登録を行います。
 2. 新規登録がされている場合は左上のメニューボタンの『ログイン』を選択してメールアドレスとパスワードを入力してログインしてください。
 3. 登録やログインが完了するとホーム画面に戻ってくるので画面中央下側の『予定を追加する』を押すと予定追加画面に転移します。各項目を記載し『登録する』を押すとカレンダーに予定が追加されます。
 4. 投稿したユーザー本人であれば追加した予定内容を編集と削除することが出来ます。
 5. 画面中央下側の『チャットする』を押すとチャットルーム画面に転移します。画面下側の『type a message』に文字を打ち込み右側の『送信』を押すとチャットを書き込むことが出来ます。ホーム画面に戻る際は『チャットを終了する』を押してください。

# 使用技術(開発環境)

# 実装予定の内容
テストコード  
AWS  
レスポンシブWebデザイン


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
| content    | text       | null: false       |
| user       | references | foreign_key: true |

### Association

- belongs_to :user
