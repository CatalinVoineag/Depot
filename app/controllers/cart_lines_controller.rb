class CartLinesController < ApplicationController

	before_action :set_scope

	def index
		@cart_lines = @scope
	end

	def new
	end

	def create
		byebug
		if product_instance(cart_lines_params)
			flash[:notice] = "Product added to cart"
	    redirect_to :back
	  else
			@cart_line = CartLine.new(cart_lines_params)
			if @cart_line.save
	      flash[:notice] = "Product added to cart"
	      redirect_to :back
	    else
	      flash.now[:error] = AlertsHelper.getErrorAlertMessages(@cart_line)
	      redirect_to :back
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

		# Before Filters

		def set_scope
			cart = Cart.where(user_id: current_user.id)
			@scope = cart.first.cart_lines
		end

		def cart_lines_params
			params.permit(:product_id, :cart_id)
		end 

end
