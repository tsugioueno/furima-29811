  require 'rails_helper'
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end
  
    describe '商品出品登録' do

      it "空がなければ登録できること" do
        expect(@item).to be_valid
      end

      it '画像が必須できること' do
        @item.image = nil
        expect(@item).to be_valid
      end

      it "商品名が空だと登録できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end


        it "商品説明が空だと登録できない" do
          @item.product_text = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Product text can't be blank")
        end


        it "カテゴリーが空だと登録できない" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category は---以外で入力して下さい。")
        end

        it "カテゴリーがIDが1（---）だと登録できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category は---以外で入力して下さい。")
        end

        it "商品の状態が空だと登録できない" do
          @item.product_condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition は---以外で入力して下さい。")
        end

        it "商品の状態がIDが1（---）だと登録できない" do
          @item.product_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition は---以外で入力して下さい。")
        end

        it "配送料の負担が空だと登録できない" do
          @item.shipping_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge は---以外で入力して下さい。")
        end

        it "配送料の負担が1（---）だと登録できない" do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge は---以外で入力して下さい。")
        end


        it "発送元の地域が空だと登録できない" do
          @item.shipping_area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area は---以外で入力して下さい。")
        end


        it "発送元の地域が1（---）だと登録できない" do
          @item.shipping_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area は---以外で入力して下さい。")
        end


        it "発送までの日数が空だと登録できない" do
          @item.days_to_ship_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship は---以外で入力して下さい。")
        end


        it "発送までの日数が1（---）だと登録できない" do
          @item.days_to_ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship は---以外で入力して下さい。")
        end


        it "販売価格が空だと登録できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "半角数字以外だと登録できない" do
          @item.price = "fff"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は半角数字で入力して下さい。")
        end

        it "販売価格が￥300以下だと登録できない" do
          @item.price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は300円以上で入力して下さい。")
        end

        it "販売価格が￥9,999,999より上だと登録できない" do
          @item.price = 100000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price は9,999,999円以下で入力して下さい。")
        end

      end
end
