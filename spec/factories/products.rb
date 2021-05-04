FactoryBot.define do
  factory :product do

    name               {"名前"}
    description        {"説明"}
    category_id        {2}
    status_id          {2}
    shipping_cost_id   {2}
    prefecture_id      {2}
    shipping_day_id    {2}
    price              {3000}
    after(:build) do |product|
      product.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
