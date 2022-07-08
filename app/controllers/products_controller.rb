class ProductsController < ApplicationController
  def index
    @products = Product.includes(:user)
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

  private
  def product_params
    params.requie(:product).permit(:name, :description, :price, :condition_id, :sipping_postage_id, :sipping_day_id, :sipping_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
