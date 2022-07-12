class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update]




  def index
   
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
   if @product.update(product_params)
      redirect_to product_path
    else
     render :edit
   end
  end



  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :shipping_postage_id, :shipping_id, :shipping_day_id, :price, :condition_id, :category_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end


  def contributor_confirmation
    redirect_to root_path unless current_user == @product.user
  end
  

end
