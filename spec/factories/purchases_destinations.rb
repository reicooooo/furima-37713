FactoryBot.define do
  factory :purchases_destinations do
    post_code { '123-4567' }
    shipping_id { 3 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    price { 2000 }
    phone_number {12345678900}
    token {"tok_abcdefghijk00000000000000000"}

    association :product

  end
end
