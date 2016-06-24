class BillAddressesController < ApplicationController
  
  before_action :set_bill, only: [:edit, :destroy, :update]

  def index
  end

  def new
  	@bil_address = BillAddress.new
  end

  def create
  	@bill_address = BillAddress.new(bill_params)
		if @bill_address.save
			flash[:notice] = "success"
		else
			flash.now[:error] = AlertsHelper.getErrorAlertMessages(@bil_address)
		end

  end

  def edit
    @bill
  end

  def update
    respond_to do |format|
      if @bill.update_attributes(bill_params)
        format.html { redirect_to edit_user_path(current_user), notice: "Bill Address Updated" }
      else
        flash.now[:error] = AlertsHelper.getErrorAlertMessages(@bill)
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @bill.destroy
    flash[:success] = "Bill Address Deleted"
    redirect_to edit_user_path(current_user)
  end

  private 

  	# Before Filters

    def set_bill
      @bill = BillAddress.find(params[:id])
    end

  	def bill_params
  		params.require(:bill_address).permit(:order_id, :user_id, :first_name, :last_name, :street_address_1, :street_address_2, :city, :country, :postcode, :phone)
  	end

end
