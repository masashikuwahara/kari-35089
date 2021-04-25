# MyArt
自分の好きな回が、または描いた絵を投稿することができます

# アプリケーション概要
ユーザー新規登録後、共有したい絵を説明文とともに投稿することで
トップページに表示されます。
各詳細ページにコメント機能もあり、他のユーザが感想を言い合ったり
チャットもすることができます。

# URL

# Basic認証
ユーザー名: admin
パスワード : 2222

#テスト用アカウント
sample@email.com パスワード:111111
test@gmail.com   パスワード:111111

# 目指した課題解決
お気に入りの画家の絵を共有したい、
もしくは自分の絵を共有したい。

# 洗い出した要件

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| favorite   | text   | null: false |
| museum     | text   | null: false |

## pictures テーブル

| Column     | Type          | Options     |
| ---------- | ------------  | ----------- |
| title      | string        | null: false |
| artist     | string        | null: false |
| where      | string        | null: false |
| image      | ActiveStorage |             |
| user       | references    |             |

## comments テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| text        | text       | null: false |
| user        | references |             |
| picture     | references |             |
