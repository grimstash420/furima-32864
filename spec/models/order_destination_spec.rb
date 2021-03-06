require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @order_destination = FactoryBot.build(:order_destination, user_id: @user.id, product_id: @product.id )
    sleep 0.1 
  end
  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order_destination).to be_valid
      end
      it '建物名が空でも購入できること' do
        @order_destination.building_name = ''
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
      it 'phone_numberが12桁以上では登録できないこと' do
        @order_destination.phone_number = "080123456789"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number Input only number") 
      end
      it 'phone_numberが数字のみでないと登録できないこと' do
        @order_destination.phone_number = "080-1234-56789"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number Input only number") 
      end
      it 'phone_numberが全角数字だと登録できないこと' do
        @order_destination.phone_number = "０８０１２３４５６７８"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number Input only number") 
      end
      it 'phone_numberが英数混合では登録できないこと' do
        @order_destination.phone_number = "abc12345678"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number Input only number") 
      end
      it 'user_idが空だと登録できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank") 
      end
      it 'product_idが空だと登録できない' do
        @order_destination.product_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Product can't be blank") 
      end
      it 'tokenが空では登録できないこと' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end 
    end
  end  
end