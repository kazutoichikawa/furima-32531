FactoryBot.define do
  factory :item do
    title           {"test"}
    explain         {"test"}
    price           {10000}
    category_id     {2}
    condition_id    {2}
    s_fee_id        {2}
    area_id         {2}
    d_f_ship_id     {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-intro01.png'), filename: 'test_image.png')
    end
  end
end
