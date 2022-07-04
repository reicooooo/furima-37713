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
has_many:products dependent::destroy
belongs_to:destination dependent::destroy
belongs_to:card dependent::destroy

###destinations

| Colum            | Type      | options                     |
|------------------|-----------|-----------------------------|
| user_id          | integer   | null:false,foreign_key:true |
| post_code        | string    | null:false                  |
| prefecture_id    | integer   | null:false                  |
| city             | string    | null:false                  |
| address          | string    | null:false                  |
| building_name    | string    |                             |
| phone_number     | string    | null:false                  |

Association
belongs_to:user

###products

| Colum            | Type      | options                     |
|------------------|-----------|-----------------------------|
| name             | string    | null:false                  |
| price            | integer   | null:false                  |
| description      | text      | null:false                  |
| condition        | string    | null:false                  |
| sipping_postage  | string    | null:false                  |
| sipping_days     | string    | null:false                  | 
| category_id      | integer   | null:false,foreign_key:ture |
| sipping_id       | integer   | null:false,foreign_key:ture |
| user_id          | references| 

Association
belongs_to:user dependent::destroy
belongs_to:category dependent::destroy
has_many:images dependent::destroy


###purchases

| Colum              | Type     | options                     |
|--------------------|----------|-----------------------------|
| user_id            | integer  | null:false,foreign_key:true |
| product_id         | integer  | null:false,foreign_key:true |
