FactoryBot.define do
  factory :item do
    product_name          {"商品名sample"}
    product_text          {"商品説明sample"}
    price                 {9999}
    category_id           {2}
    product_condition_id  {2}
    shipping_charge_id    {2}
    shipping_area_id      {2}
    days_to_ship_id       {2}

    association :user 
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  
  end
end
