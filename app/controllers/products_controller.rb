class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy] 
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @product = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end    
  end

  def show
    
  end

  def edit
    if @product.order.present?
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to action: 'show'
    else
      render :edit
    end   
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end
  private
  
  def correct_user
    redirect_to root_path unless current_user.id == @product.user_id
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
    def product_params
      params.require(:product).permit(:name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
    end
end
