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