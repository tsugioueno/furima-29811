FactoryBot.define do
  factory :buyer_item_purchase do
    token                 {"tok_abcdefghijk00000000000000000"}
    postal_code           {"999-9999"}
    shipping_area_id      {2}
    city                  {"osaka"}
    addresses             {"1-1"}
    phone_number          {"00099997777"}
  end
end
