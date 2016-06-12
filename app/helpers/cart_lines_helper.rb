module CartLinesHelper

	def price_tag(line)
		number_to_currency(line.product.price * line.quantity)
	end

	def total_price(cart)
		total = 0
		cart.cart_lines.each do |line|
			total += (line.product.price * line.quantity) 
		end
		number_to_currency(total)
	end

end
