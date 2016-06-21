class BillAddressesController < ApplicationController
  
  def index
  end

  def new
  	@bil_address = BillAddress.new
  end

  def create
  	@bill_address = BillAddress.new(bill_params)
  	byebug
		if @bill_address.save
			flash[:notice] = "success"
		else
			flash.now[:error] = AlertsHelper.getErrorAlertMessages(@bil_address)
		end

  end

  def show
  end

  def destroy
  end

  private 

  	# Before Filters

  	def bill_params
  		params.require(:bill_address).permit(:order_id, :user_id, :first_name, :last_name, :street_address_1, :street_address_2, :city, :country, :postcode, :phone)
  	end

end
