class CartLinesController < ApplicationController

	before_action :set_scope

	def index
		@cart_lines = @scope
	end

	def new
	end

	def create
		if CartLine.create_cart_line(cart_lines_params, current_cart) == true
			flash[:notice] = "Product added to cart"
			redirect_to :back
		else
			#flash.now[:error] = AlertsHelper.getErrorAlertMessages(@cart_line)
			flash.now[:error] = "Error"
		  redirect_to :back
		end
	end

	def edit_quantity
		@cart_line = CartLine.find(params[:id])
		quantity = params[:cart_line][:quantity].to_i
		@cart_line.edit_line_quantity(quantity)
		redirect_to cart_lines_path
	end

	def update
	end

	def destroy
		@cart_line = CartLine.find(params[:id])
		@cart_line.destroy
		redirect_to cart_lines_path
	end

	private

		# Before Filters

		def set_scope
			cart = Cart.where(user_id: current_user.id)
			@scope = cart.first.cart_lines
		end

		def cart_lines_params
			params.permit(:product_id, :cart_id)
		end 

end
