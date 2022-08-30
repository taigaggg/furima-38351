FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test1111'}
    password_confirmation {password}
    last_name_full        {'山田'}
    first_name_full       {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'1935_01_01'}
  end
end