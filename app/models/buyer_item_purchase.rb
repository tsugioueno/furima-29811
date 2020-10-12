class BuyerItemPurchase
  include ActiveModel::Model
  attr_accessor :token,:user_id,:item_id,:postal_code,:shipping_area_id,:city,:addresses,:building_name,:phone_number
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id
    validates :city
    validates :addresses
    validates :phone_number
  end

    validates :shipping_area_id, numericality: { other_than: 1 , message: 'は---以外で入力して下さい。'}

  def save
    ItemPurchase.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number)
  end
end