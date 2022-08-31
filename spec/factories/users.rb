FactoryBot.define do
  factory :user do
    nickname              {Faker::Name}
    email                 {Faker::Internet.free_email}
    password              {'test11111'}
    password_confirmation {password}
    last_name_full        {'山田'}
    first_name_full       {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'1935-01-01'}
  end
end