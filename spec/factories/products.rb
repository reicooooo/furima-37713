FactoryBot.define do
  factory :product do
    name                   {"aaa"}
    description            {Faker::Lorem.sentence}
    category_id            {3}
    condition_id           {3}
    shipping_postage_id    {3}
    shipping_day_id        {3}
    shipping_id            {3}
    price                  {"1000"}
    
    association :user 

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
    
  end
end
