class ItemPurchase < ApplicationRecord
  # 購入者情報(item/userの組み合わせを補完する場所)
  belongs_to :user
  belongs_to :item
  has_one :buyer
end
