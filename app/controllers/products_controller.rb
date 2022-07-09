class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, expect: [:index, :new, :create]

  def index
    @products = Product.includes(:user)
    @products = Product.order("created_at DESC")
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
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end



  private
  def product_params
    params.require(:product).permit(:condition_id, :sipping_postage_id, :sipping_day_id, :sipping_id, :category_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find_by(params[:id])
  end

end
