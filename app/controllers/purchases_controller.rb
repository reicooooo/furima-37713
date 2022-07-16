class PurchasesController < ApplicationController
  before_action :set_product, only: [:index, :create,]
  before_action :authenticate_user!
  before_action :contributor_confirmation

  def index
    @purchases_destinations = PurchasesDestinations.new
  
    
  end


  def create
    
    @purchases_destinations = PurchasesDestinations.new(purchases_destinations_params)
    if @purchases_destinations.valid?
      pay_product
      @purchases_destinations .save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchases_destinations_params
    params.require(:purchases_destinations).permit(:post_code, :shipping_id, :city, :address, :building_name, :phone_number).merge(purchase_id: [:purchase_id], product_id: params[:product_id], user_id: current_user.id, token: params[:token])
  end

  def pay_product
   
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @product.price,  
      card: purchases_destinations_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end


  def contributor_confirmation
    if @product.user_id == current_user.id || @product.purchase != nil
      redirect_to root_path 
    end
  end
  

end

