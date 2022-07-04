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
belongs_to:purchase



###destinations

| Colum            | Type      | options                     |
|------------------|-----------|-----------------------------|
| post_code        | string    | null:false                  |
| prefecture_id    | integer   | null:false                  |
| city             | string    | null:false                  |
| address          | string    | null:false                  |
| building_name    | string    |                             |
| phone_number     | string    | null:false                  |

Association
has_one:purchase


###products

| Colum            | Type      | options                     |
|------------------|-----------|-----------------------------|
| name_id          | integer   | null:false,foreign_key:ture |
| price_id         | integer   | null:false,foreign_key:ture |
| description_id   | integer   | null:false,foreign_key:ture |
| condition_id     | integer   | null:false,foreign_key:ture |
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
| user_id            | integer  | null:false,foreign_key:true |
| product_id         | integer  | null:false,foreign_key:true |

Assocoation
belongs_to:user
belongs_to:product
