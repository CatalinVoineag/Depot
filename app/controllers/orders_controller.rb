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
			if @order.create_bill_in_order(params[:bill_address]) && @order.create_delivery_in_order(params[:delivery_address]) && @order.create_order_lines(current_cart)
				@order.update_attribute(:step, 'payment') 
				flash[:notice] = "success"
				redirect_to new_order_path(anchor: 'payment')
			else
				flash[:error] = @order.error.full_messages.join('')
				@order.destroy
			end
		else
			flash.now[:error] = AlertsHelper.getErrorAlertMessages(@order)
			redirect_to :back
		end
	end

	private

		def order_params
			params.require(:order).permit(:user_id, :total_price, :email, :delivery_address_id, :bill_address_id)
		end

end
