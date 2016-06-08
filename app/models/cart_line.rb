class CartLine < ActiveRecord::Base

	belongs_to :cart
	belongs_to :product

	# Increases the quantity of a product in cart line
	def increase_quantity
		cart_lines = self.cart.cart_lines
		result = ''
		cart_lines.each do |line|
			if line.product_id == self.product_id
				byebug
				self.quantity += 1
				result = true
			else
				self.quantity = 1
				result = false
			end
		end
		 result
	end

end
