FactoryBot.define do
  factory :user do
    nickname {Faker::Name.nickname}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    first_kana_name {Faker::Name.first_kana_name}
    last_kana_name {Faker::Name.last_kana_name}
    birth_date {Faker::Date.birth_date}
  end
end