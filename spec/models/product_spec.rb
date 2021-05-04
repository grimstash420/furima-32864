require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品情報入力' do
    context '商品情報の入力がうまく行く時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@product).to be_valid
      end
    end
    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category Select")
      end
      it 'statusが未選択だと出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status Select")
      end
      it 'shipping_costが未選択だと出品できない' do
        @product.shipping_cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost Select")
      end
      it 'prefectureが未選択だと出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture Select")
      end
      it 'shipping_dayが未選択だと出品できない' do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day Select")
      end
      it 'priceが空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
