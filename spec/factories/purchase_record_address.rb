FactoryBot.define do
  factory :purchase_record_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    number { '1-1' }
    building_name { '東京ハイツ' }
    number { '1-1' }
  end
end
