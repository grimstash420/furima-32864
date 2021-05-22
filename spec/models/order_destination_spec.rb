require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    @order_destination = FactoryBot.build(:order_destination)
  end
  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order_destination).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'postcodeが空だと購入できない' do
        @order_destination.postcode = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeにハイフンがないと購入できない' do
        @order_destination.postcode = "1234567"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postcode Input correctly")
      end
      it 'prefectureが未選択だと購入できない' do
        @order_destination.prefecture_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空だと購入できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが10桁では購入できない' do
        @order_destination.phone_number = "0801234567"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number Input only number") 
      end
    end
  end  
end