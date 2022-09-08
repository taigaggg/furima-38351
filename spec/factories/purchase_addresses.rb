FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '京都市' }
    block_number { '1-1' }
    building { '京都ハイツ' }
    phone_number { "08011111111" }

  end
end
