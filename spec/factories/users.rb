FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    encrypted_password    {password}
    family_name           {"山田"}
    first_name            {"陸太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"リクタロウ"}
    birthday              {"2000-12-12"}

  end
end
