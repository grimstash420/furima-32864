FactoryBot.define do
  factory :order_destination do
    token               {"4242424242424242"}
    postcode            {"123-4567"}
    prefecture_id       {2}
    city                {"断捨離村"}
    address             {"123-4"}   
    phone_number        {"08012345678"}
  end
end
