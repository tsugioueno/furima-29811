class Buyer < ApplicationRecord
  # 購入者の住所を記録するテーブル
  attr_accessor :token
  belongs_to :item_purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area
  
  # validates :token, presence: true

end
