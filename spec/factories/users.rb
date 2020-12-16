FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"test12"}
    password_confirmation {password}
    l_name                {'手スと'}
    f_name                {'手スと'}
    l_name_r              {'テスト'}
    f_name_r              {'テスト'}
    birthday              {'1994-11-24'}
  end
end