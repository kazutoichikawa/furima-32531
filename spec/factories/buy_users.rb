FactoryBot.define do
  factory :buy_user do
    token {"tok_abcdefghijk00000000000000000"}
    p_code {"123-4567"}
    prefecture_id {2}
    city {"てすと"}
    address {"てすと"}
    building {"てすと"}
    p_num {"08012345678"}
    user_id {1}
    item_id {1}
  end
end
