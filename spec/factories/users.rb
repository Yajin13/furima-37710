FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {"12345f"}
    password_confirmation {password}
    first_name {"三郎"}
    last_name {"田中"}
    first_kana_name {"サブロウ"}
    last_kana_name {"タナカ"}
    birth_date {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end