class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  has_one_attached       :image
  belongs_to             :user
  has_one                :product

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end  
  validates :price, numericality: { only_integer: true, message: "Half-width number." }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :category_id, numericality: { other_than: 1, message: "Select" }
  validates :status_id, numericality: { other_than: 1, message: "Select" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "Select" }
  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "Select" }
end
    