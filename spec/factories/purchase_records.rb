FactoryBot.define do
  factory :purchase_record do
    item_id
    user_id
    token {"tok_abcdefghijk00000000000000000"}
  end
end