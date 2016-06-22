class DeliveryAddressesController < ApplicationController
	
  def index
  end

  def show

  def new
  end

  def create
  end

  def destroy
  end

 	private

 		def delivery_params
 			params.require(:delivery_address).permit(:order_id, :user_id, :first_name, :last_name, :street_address_1, :street_address_2, :city, :country, :postcode, :phone)
 		end

end
