class PaymentsController < ApplicationController

	before_action :set_payment, only: [:edit, :update, :destroy]

	def index
	end

	def new
		@payment = Payment.new
	end

	def create
		@payment = Payment.new(payment_params)
		respond_to do |format|
      if @payment.save
        format.html { redirect_to root_path, notice: "Payment Created" }
       
        redirect_to new_order_path(anchor: 'summary')
      else
        flash.now[:error] = AlertsHelper.getErrorAlertMessages(@payment)
        format.html { redirect_to new_order_path( anchor: 'payment') }
      end
    end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

		def payment_params
			params.require(:payment).permit(:amout, :card_no, :card_code, :expiration_date, :card_name, :user_id, :order_id)
		end

		def set_payment
			@payment = Payment.find(params[:id])
		end

end
