class CartLine < ActiveRecord::Base

	belongs_to :cart
	belongs_to :product


	def self.create_cart_line(params, cart)
		lines = cart.cart_lines
		dupp = false
		result = nil
		unless lines.blank?
			lines.each do |line|
				if line.product_id == params[:product_id].to_i
					line.quantity += 1
					line.save
					dupp = true
					result = true
				end
			end
		end
		if !dupp 
			cart_line = CartLine.new(params)
			if cart_line.valid?
				cart_line.update_attribute(:quantity, 1)
				cart_line.save
				result = true 
			else
				self.errors.add('', cart_line.errors.full_messages)
				result = false
			end 
		end
		result
	end

	def edit_line_quantity(quantity)
		if quantity != 0
			self.update_attribute(:quantity, quantity)
		else
			self.destroy
		end
	end

end
