require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品情報の保存' do
    context "商品情報が保存できるとき" do

      it '全ての項目が入力されていれば出品できる' do
        expect(@product).to be_valid
      end
    end


    context "商品情報が保存できないとき" do

      it "商品名が空だと登録できない" do
        @product.name = '' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が空だと保存できない" do
        @product.description = '' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it "価格が空だと保存できない" do
        @product.price = '' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it "商品の状態が空だと保存できない" do
        @product.condition_id = '' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end     

      it "商品のカテゴリーが空だと保存できない" do
        @product.category_id = '' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it "配送料の負担が空だと保存できない" do
        @product.shipping_postage_id = '' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping postage can't be blank")
      end

      it "発送元の地域が空だと保存できない" do
        @product.shipping_id = '' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping can't be blank")
      end

      it "発送日数が空だと保存できない" do
        @product.shipping_day_id = '' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end

      it "商品画像がないと保存できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it "ユーザーが紐付いていないとは保存できない" do
        @product.user = nil 
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
      
      it "価格は半角数値でないと保存できない" do
        @product.price = '１２３４' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Price out of setting range")
      end

      it "価格が299円以下だと保存できない" do
        @product.price = "290"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price out of setting range")
      end

      it "価格が10000000円以上だと保存できない" do
        @product.price = "111111111"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price out of setting range")
      end

      it "商品カテゴリーが---の時は保存できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態が---の時は保存できない" do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it "配送料の負担が---の時は保存できない" do
        @product.shipping_postage_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping postage can't be blank")
      end

      it "発送元の地域が---の時は保存できない" do
        @product.shipping_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping can't be blank")
      end

      it "発送日数が---の時は保存できない" do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end

      it "商品説明が1000文字以上だと保存できない" do
        @product.description = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end





    end
  end
end
