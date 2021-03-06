###usersテーブル

| Colum                | Type     | options                 |
|--------------------- |----------|-------------------------|
| nickname             | string   | null:false              |
| email                | string   | null:false,unique: true |
| encrypted_password   | string   | null:false              |
| family_name          | string   | null:false              |
| first_name           | string   | null:false              |
| family_name_kana     | string   | null:false              |
| first_name_kana      | string   | null:false              |
| birthday             | date     | null:false              |

Association
has_many:products 
has_many:purchases



###destinations

| Colum            | Type      | options                     |
|------------------|-----------|-----------------------------|
| post_code        | integer   | null:false                  |
| sipping_id        | integer   | null:false                  |
| city             | string    | null:false                  |
| address          | string    | null:false                  |
| building_name    | string    |                             |
| phone_number     | string    | null:false                  |
| purchase         | references| null:false,foreign_key: true|

Association
belongs_to:purchase


###products

| Colum             | Type      | options                     |
|-------------------|-----------|-----------------------------|
| name              | string    | null:false                  |
| price             | integer   | null:false                  |
| description       | text      | null:false                  |
| condition_id      | integer   | null:false                  |
| shipping_postage_id| integer   | null:false                  |
| shipping_day_id    | integer   | null:false                  | 
| category_id       | integer   | null:false                  |
| shipping_id        | integer   | null:false                  |
| user              | references| null:false,foreign_key:ture |

Association
belongs_to:user 
has_one:purchase


###purchases

| Colum              | Type       | options                     |
|--------------------|------------|-----------------------------|
| user               | references | null:false,foreign_key:true |
| product            | references | null:false,foreign_key:true |

Assocoation
belongs_to:user
belongs_to:product
has_one:destination
