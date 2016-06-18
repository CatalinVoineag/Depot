module OrdersHelper

	def order_total_price(cart)
		total = 0
		cart.cart_lines.each do |line|
			total += (line.product.price * line.quantity) 
		end
		number_to_currency(total)
	end

end
