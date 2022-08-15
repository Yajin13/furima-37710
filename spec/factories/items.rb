FactoryBot.define do
  factory :item do

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    item_name {"ああ"}
    item_explain {"いいい"}

    item_category_id {"2"}
    item_condition_id {"2"}
    delivery_charge_id {"2"}
    prefecture_id {"2"}
    delivery_day_id {"2"}

    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user 
  end
end