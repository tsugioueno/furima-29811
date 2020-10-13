require 'rails_helper'

RSpec.describe BuyerItemPurchase, type: :model do
  before do
    @buyer_item_purchase = FactoryBot.build(:buyer_item_purchase)
  end

  describe '商品購入機能' do

  it "空がなければ登録できること" do
    expect(@buyer_item_purchase).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @buyer_item_purchase.token = nil
    @buyer_item_purchase.valid?
    expect(@buyer_item_purchase.errors.full_messages).to include("Token can't be blank")
  end

  it "郵便番号が空では登録できないこと" do
    @buyer_item_purchase.postal_code = nil
    @buyer_item_purchase.valid?
    expect(@buyer_item_purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
  end

  it "郵便番号が３桁-４桁の数字でないと登録できないこと" do
    @buyer_item_purchase.postal_code = "55555555"
    @buyer_item_purchase.valid?
    expect(@buyer_item_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end

  it "発送元の地域が空だと登録できない" do
    @buyer_item_purchase.shipping_area_id = nil
    @buyer_item_purchase.valid?
    expect(@buyer_item_purchase.errors.full_messages).to include("Shipping area は---以外で入力して下さい。")
  end

  it "発送元の地域が1（---）だと登録できない" do
    @buyer_item_purchase.shipping_area_id = 1
    @buyer_item_purchase.valid?
    expect(@buyer_item_purchase.errors.full_messages).to include("Shipping area は---以外で入力して下さい。")
  end

  it "市区町村が空だと登録できない" do
    @buyer_item_purchase.city = nil
    @buyer_item_purchase.valid?
    expect(@buyer_item_purchase.errors.full_messages).to include("City can't be blank")
  end

  it "番地が空だと登録できない" do
    @buyer_item_purchase.addresses = nil
    @buyer_item_purchase.valid?
    expect(@buyer_item_purchase.errors.full_messages).to include("Addresses can't be blank")
  end

  it "電話番号が空だと登録できない" do
    @buyer_item_purchase.phone_number = nil
    @buyer_item_purchase.valid?
    expect(@buyer_item_purchase.errors.full_messages).to include("Phone number can't be blank")
  end

  it "電話番号が半角数字でないと登録できない" do
    @buyer_item_purchase.phone_number = "aaabbbbcccc"
    @buyer_item_purchase.valid?
    expect(@buyer_item_purchase.errors.full_messages).to include("Phone number は半角数字で入力して下さい。")
  end

  end
end
