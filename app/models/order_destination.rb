class OrderDestination 
  include ActiveModel::Model
  
  attr_accessor :postcode, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :product_id, :token

  with_options presence: true do
    validates :token
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
    validates :user_id                       
    validates :product_id

  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end