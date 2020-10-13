class BuyerItemPurchase
  include ActiveModel::Model
  attr_accessor :token,:user_id,:item_id,:postal_code,:shipping_area_id,:city,:addresses,:building_name,:phone_number
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id
    validates :city
    validates :addresses
    validates :phone_number, length: {maximum: 11, message: 'は11桁以内で入力して下さい。'} ,format: {with: /\A[0-9]{9,11}/, message: 'は数字のみで入力して下さい。'}
    validates :token
  end
    validates :phone_number, numericality: { message: 'は半角数字で入力して下さい。' }
    validates :shipping_area_id, numericality: { other_than: 1 , message: 'は---以外で入力して下さい。'}

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end