class PurchasesDestinationsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def new
    
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      @purchase_destination .save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:post_code, :shipping_id, :city, :address, :building_name, :phone_number, :price).merge(user_id: current_user.id)
  end

end
