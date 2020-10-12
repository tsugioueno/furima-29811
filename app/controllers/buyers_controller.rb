class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyer = Buyer.new
    @buyer_item_purchase = BuyerItemPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_item_purchase = BuyerItemPurchase.new(buyer_params)
    if @buyer_item_purchase.valid?
      pay_item
      @buyer_item_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:buyer_item_purchase).permit(:token,:postal_code,:shipping_area_id,:city,:addresses,:building_name,:phone_number).merge(item_id: params[:item_id],user_id: params[:user_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
