class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @product = Product.find(params[:product_id])
    @purchases_destinations = PurchasesDestinations.new
  end



  def create
    @product = Product.find(params[:product_id])
    @purchases_destinations = PurchasesDestinations.new(purchase_params)
    if @purchases_destinations.valid?
      @purchases_destinations.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchases_destinations).permit(:post_code, :shippind_id, :city, :address, :building_name, :phone_number,:price).merge(user_id: current_user.id, product_id: @product.id)
  end

  #def destination_params
  #  params.permit(:post_code, :shipping_id, :city, :address, :building_name).merge(purchase_id: @purchase.id)
  #end
end
