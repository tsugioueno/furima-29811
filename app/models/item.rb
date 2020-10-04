class Item < ApplicationRecord
 belongs_to :user
 has_many :item_purchases
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to_active_hash :category
 belongs_to_active_hash :product_condition
 belongs_to_active_hash :shipping_charge
 belongs_to_active_hash :shipping_area
 belongs_to_active_hash :days_to_ship
 has_one_attached :image

 validates :category_id, :product_condition_id, :shipping_charge_id,:shipping_area_id,:days_to_ship_id, numericality: { other_than: 1 , message: 'は---以外で入力して下さい。'}
 validates :price, numericality: {greater_than: 300 , message: 'は300円以上で入力して下さい。'}
 validates :price, numericality: {less_than: 9999999, message: 'は9,999,999円以下で入力して下さい。'} 

 with_options presence: true do
  validates :product_name
  validates :product_text
  validates :price, numericality: { message: 'は半角数字で入力して下さい。' }
  #validates :price, format: {with:/\A[0-9]+\z/, message: 'は半角数字で入力して下さい。'}

 end
end
