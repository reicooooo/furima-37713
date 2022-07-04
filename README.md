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
has_many:purchase



###destinations

| Colum            | Type      | options                     |
|------------------|-----------|-----------------------------|
| post_code        | string    | null:false                  |
| prefecture_id    | integer   | null:false                  |
| city             | string    | null:false,foreign_key: true|
| address          | string    | null:false,foreign_key: true|
| building_name    | string    |                             |
| phone_number     | string    | null:false,foreign_key: true|

Association
belongs_to:purchase


###products

| Colum            | Type      | options                     |
|------------------|-----------|-----------------------------|
| name             | string    | null:false                  |
| price            | integer   | null:false                  |
| description      | string    | null:false                  |
| condition        | string    | null:false                  |
| sipping_postage  | string    | null:false                  |
| sipping_days     | string    | null:false                  | 
| category_id      | integer   | null:false,foreign_key:ture |
| sipping_id       | integer   | null:false,foreign_key:ture |
| user_id          | references| null:false,foreign_key:ture |

Association
belongs_to:user 
has_one:purchase


###purchases

| Colum              | Type     | options                     |
|--------------------|----------|-----------------------------|
| user               | integer  | null:false,foreign_key:true |
| product            | integer  | null:false,foreign_key:true |

Assocoation
belongs_to:user
belongs_to:product
belongs_to:desinations
