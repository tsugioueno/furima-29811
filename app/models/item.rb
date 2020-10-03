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

 validates :category_id, :product_condition_id, :shipping_charge_id,:shipping_area_id,:days_to_ship_id, numericality: { other_than: 1 }
 validates :price, presence: true ,numericality: {greater_than: 300},numericality: {less_than: 9999999}
end
