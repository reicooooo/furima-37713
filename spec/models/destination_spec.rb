require 'rails_helper'


RSpec.describe Destination, type: :model do
  before do
    @destination = FactoryBot.build(:destination)
  end

  describe '配送先の情報' do
    context "配送先の情報が保存できるとき" do

      it '建物以外の項目が全て入力されていれば登録できる' do
        expect(@destination).to be_valid
      end


    end

    context "配送先の情報が登録できないとき" do

      

        it "郵便番号が空だと登録できない" do
          @destination.post_code = '' 
          @destination.valid?
          expect(@destination.errors.full_messages).to include("PostCode can't be blank")
        end

        it "郵便番号が3桁ハイフン4桁でないと登録できない" do
          @destination.post_code = '1234567' 
          @destination.valid?
          expect(@destination.errors.full_messages).to include("PostCode can't be blank")
        end

        it "郵便番号が半角文字列でないと登録できない" do
          @destination.post_code = '１２３−４５６７' 
          @destination.valid?
          expect(@destination.errors.full_messages).to include("PostCode can't be blank")
        end

        it "都道府県が空だと登録できない" do
          @destination.shipping_id = '' 
          @destination.valid?
          expect(@destination.errors.full_messages).to include("Shipping can't be blank")
        end

        it "市区町村が空だと登録できない" do
          @destination.city = '' 
          @destination.valid?
          expect(@destination.errors.full_messages).to include("City can't be blank")
        end

        it "番地が空だと登録できない" do
          @destination.address= '' 
          @destination.valid?
          expect(@destination.errors.full_messages).to include("Address can't be blank")
        end

        it "電話番号が空だと登録できない" do
          @destination.phone_number = '' 
          @destination.valid?
          expect(@destination.errors.full_messages).to include("PhoneNumber can't be blank")
        end

        it " 電話番号は、10桁以上11桁以内でないと登録できない" do
          @destination.phone_number = '123456789000' 
          @destination.valid?
          expect(@destination.errors.full_messages).to include("PhoneNumber can't be blank")
        end

        it " 電話番号は、半角数値でないと登録できない" do
          @destination.phone_number = '1234567890' 
          @destination.valid?
          expect(@destination.errors.full_messages).to include("PhoneNumber can't be blank")
        end








        
  

end
