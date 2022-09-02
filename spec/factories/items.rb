FactoryBot.define do
  factory :item do
    item_name             {Faker::Lorem.sentence}
    explanation           {Faker::Lorem.sentence}
    category_id           {2}
    condition_id          {2}
    postage_id            {2}
    prefecture_id         {2}
    send_date_id          {2}
    price                 {10000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'image')
    end
  end
end
