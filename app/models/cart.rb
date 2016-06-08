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

end
