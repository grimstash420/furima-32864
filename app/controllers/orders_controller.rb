class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @destination = OrderDestination.new
  end

  def create
    @product = Product.find(params[:product_id])
    @destination = OrderDestination.new(destination_params)
    
    if @destination.valid?
      pay_item
      @destination.save
      redirect_to root_path
    else
      render :index
    end

  end
  private
  def destination_params
    params.require(:order_destination).permit(:postcode, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], product_id: params[:product_id])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  #PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @product.price,  # 商品の値段
        card: destination_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
