require 'rails_helper'

RSpec.describe PurchasesDestinations, type: :model do
  describe '配送先の情報' do
         before do
          user = FactoryBot.create(:user)
          sleep(0.1)
          product = FactoryBot.create(:product)
          sleep(0.1)
           @purchases_destinations = FactoryBot.build(:purchases_destinations, user_id: user.id, product_id: product.id)
         end
       
  
    
       context "内容に問題ないときとき" do
          it '全ての項目が正しく入力されていれば保存できる' do
            expect(@purchases_destinations).to be_valid
          end
          it 'building_nameは空でも保存できる' do
            @purchases_destinations.building_name = ''
            expect(@purchases_destinations).to be_valid
          end
       end
  
       context "内容に問題があるときとき" do
          it "郵便番号が空だと保存できない" do
            @purchases_destinations.post_code = '' 
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Post code can't be blank")
          end
  
          it "郵便番号が3桁ハイフン4桁でないと保存できない" do
            @purchases_destinations.post_code = '1234567' 
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
          end
  
          it "郵便番号が半角文字列でないと保存できない" do
            @purchases_destinations.post_code = '１２３−４５６７' 
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
          end
  
          it "都道府県が---だと保存できない" do
            @purchases_destinations.shipping_id = 1
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Shipping can't be blank")
          end
  
          it "市区町村が空だと保存できない" do
            @purchases_destinations.city = '' 
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("City can't be blank")
          end
  
          it "番地が空だと保存できない" do
            @purchases_destinations.address= '' 
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Address can't be blank")
          end
  
          it "電話番号が空だと保存できない" do
            @purchases_destinations.phone_number = '' 
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Phone number can't be blank")
          end
  
          it " 電話番号は、9桁以下だと保存できない" do
            @purchases_destinations.phone_number = '12345678' 
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Phone number is invalid")
          end

          it " 電話番号は、12桁以上だと保存できない" do
            @purchases_destinations.phone_number = '1234567890000' 
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Phone number is invalid")
          end
  
          it " 電話番号は、半角数値でないと保存できない" do
            @purchases_destinations.phone_number = '１２３４５６７８９０' 
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Phone number is invalid")
          end

          it 'userが紐付いていないと保存できないこと' do
            @purchases_destinations.user_id = nil
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("User can't be blank")
          end

          it "tokenが空では登録できないこと" do
            @purchases_destinations.token = nil
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Token can't be blank")
          end

          t "商品情報が紐付いていないと保存できないこと" do
            @purchases_destinations.product_id = nil
            @purchases_destinations.valid?
            expect(@purchases_destinations.errors.full_messages).to include("Product can't be blank")
          end 
       end
  end
end
