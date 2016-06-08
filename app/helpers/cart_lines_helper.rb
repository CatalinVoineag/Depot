module CartLinesHelper

	def product_instance(params)
		#byebug
		cart_lines = current_cart.cart_lines
		result = ''
		cart_lines.each do |line|
			if line.product_id == params[:product_id]
				line.quantity += 1
				result = true
			else
				result = false
			end
		end
		return result
	end

end
