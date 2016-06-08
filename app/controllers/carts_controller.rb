class CartsController < ApplicationController

	before_action :set_cart 

	def index
		@cart
	end

	def edit
	end

	def update
	end

	private

		# Before Filters
		
		def set_cart
			@cart = current_cart
		end 

		#def cart_params
	##		params.require(:cart).permit(:)
	#	end

end
