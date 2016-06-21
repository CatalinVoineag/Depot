class OrdersController < ApplicationController

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
			if @order.create_bill_in_order(params[:bill_address])
				flash[:notice] = "success"
				redirect_to orders_path
			else
				flash[:error] = @order.error.full_messages.join('')
				@order.destroy
			end
		else
			flash.now[:error] = AlertsHelper.getErrorAlertMessages(@order)
			redirect_to :back
		end

		#if Order.create_order(current_user, current_cart)
		#	flash[:notice] = "Order Created"
		#	redirect_to orders_path
		#else
		#	flash[:error] = "error"
		#	redirect_to cart_lines_path
		#end
	end

	private

		def order_params
			params.require(:order).permit(:user_id, :total_price, :email, :delivery_address_id, :bill_address_id)
		end

end
