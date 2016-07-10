class BillAddressesController < ApplicationController
  
  before_action :set_bill, only: [:edit, :destroy, :update, :show]

  after_filter :verify_authorized

  def new
  	@bill = BillAddress.new
    authorize @bill
  end

  def create
  	@bill = BillAddress.new(bill_params)
		authorize @bill
    if @bill.save
			flash[:notice] = "success"
      redirect_to user_path(current_user)
		else
      render :new
			flash.now[:error] = AlertsHelper.getErrorAlertMessages(@bill)
		end

  end

  def edit
    @bill
    authorize @bill
  end

  def update
    authorize @bill
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
    authorize @bill
    render :edit
  end

  def destroy
    authorize @bill
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
