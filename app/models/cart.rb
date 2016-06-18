class Cart < ActiveRecord::Base

	has_many :cart_lines, dependent: :destroy

	belongs_to :user

	# Returns one instance of a product
	def product
		lines = self.cart_lines
		arr = []
		lines.each do |line|
			arr << line
		end
		
	end

	def cart_total_price
		total = 0
		self.cart_lines.each do |line|
			total += (line.product.price * line.quantity)
		end
		total.to_i
	end

end
