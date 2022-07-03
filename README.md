###userテーブル

| Colum                | Type     | options    |
|--------------------- |----------|------------|
| nickname             | string   | null:false |
| email                | string   | null:false |
| encrypted_password   | string   | null:false |
| user_image           | string   |            |
| family_name          | string   | null:false |
| first_name           | string   | null:false |
| family_name_kana     | string   | null:false |
| first_name_kana      | string   | null:false |
| birthday             | date     | null:false |

Association
has_many:products dependent::destroy
belongs_to:destination dependent::destroy
belongs_to:card dependent::destroy

###destination

| Colum            | Type      | options                     |
|------------------|-----------|-----------------------------|
| family_name      | string    | null:false                  |
| first_name       | string    | null:false                  |
| family_name_kana | string    | null:false                  |
| user_id          | integer   | null:false,foreign_key:true |
| post_code        | string    | null:false                  |
| prefecture       | string    | null:false                  |
| city             | string    | null:false                  |
| address          | string    | null:false                  |
| building_name    | string    | null:false                  |
| phone_number     | string    | null:false                  |

Association
belongs_to:user

###products

| Colum            | Type      | options                     |
|------------------|-----------|-----------------------------|
| name             | string    | null:false                  |
| price            | string    | null:false                  |
| description      | string    | null:false                  |
| size             | string    | null:false                  |
| condition        | string    | null:false                  |
| sipping_postage  | string    | null:false                  |
| sipping_days     | string    | null:false                  | 
| user_id          | integer   | null:false,foreign_key:ture |
| category         | integer   | null:false,foreign_key:ture |
| sipping_id       | integer   | null:false,foreign_key:ture |

Association
belongs_to:user dependent::destroy
belongs_to:category dependent::destroy
has_many:images dependent::destroy
belongs_to_active_hash:prefecture

###images

| Colum              |Type     | options                      |
|--------------------|---------|------------------------------|
| image              | string  | null:false                   |
| product_id         | integer | null:false,foreign_key:ture  |

Association
belongs_to:product

