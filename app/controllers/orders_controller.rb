class OrdersController < ApplicationController

	def index
		#@orders = current_user.orders
		@orders = Order.all
	end

	def create
		if Order.create_order(current_user, current_cart)
			flash[:notice] = "Order Created"
			redirect_to orders_path
		else
			flash[:error] = "error"
			redirect_to cart_lines_path
		end
	end

	private

		#def order_params
	#		params.require(:order).permit(:user_id)
#		end

end
