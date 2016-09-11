class OrdersController < ApplicationController

	before_filter  :set_order, only: [:edit, :update, :destroy, :show, :create_payment, :new_payment, :order_confirmation, :confirm_order] 

	def index
		#@orders = current_user.orders
		@orders = Order.all
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		if @order.save
			if @order.create_bill_in_order(params[:bill_address]) && @order.create_delivery_in_order(params[:delivery_address]) && @order.create_order_lines(current_cart)
				@order.update_attribute(:step, 'payment') 
				flash[:notice] = "success"
				redirect_to order_new_payment_path(@order)
			else
				flash[:error] = @order.errors.full_messages.join('')
				@order.destroy
			end
		else
			flash.now[:error] = AlertsHelper.getErrorAlertMessages(@order)
			redirect_to :back
		end
	end

	def new_payment
		@payment = Payment.new

	end

	def create_payment
		if @order.create_payment(params[:payment])
			@order.update_attribute(:step, 'confirmation')
			flash[:notice] = "Payment success"
			redirect_to order_confirmation_path(@order)	
		else
			flash[:error] = AlertsHelper.getErrorAlertMessages(@order)
			render :new_payment
		end
	end

	def order_confirmation
		@order
	end

	def confirm_order
		if @order.confirmation_check(['bill_address', 'delivery_address', 'payment'])
			flash[:notice] = "Order Placed"
			redirect_to products_path
		else
			flash[:error] = getErrorAlertMessages.getErrorAlertMessages(@order)
			byebug
			1 == 1
		end
	end

	private

		def order_params
			params.require(:order).permit(:user_id, :total_price, :email, :delivery_address_id, :bill_address_id)
		end

		# Before Filters

		def set_order
			@order = Order.find(params[:id])
			#@payment = @order.payment.where(id: params[:payment_id])
		end		
			

end
