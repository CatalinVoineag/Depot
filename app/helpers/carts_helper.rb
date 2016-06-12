module CartsHelper

	def cart_lines_count(cart)
		count = 0
		cart.cart_lines.each do |line|
			count += line.quantity
		end
		count
	end

end
