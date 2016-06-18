class Order < ActiveRecord::Base

	validates_presence_of :user_id, :total_price, :email

	has_many :order_lines

	belongs_to :user

	def self.create_order(user, cart)
		result = ''
		order_fields = { user_id: user.id,
										 email: user.email,
										 total_price: cart.cart_total_price
									 }

		order = Order.new(order_fields)
		if order.save
			cart.cart_lines.each do |line|
				order_line = OrderLine.new(order_id: order.id, product_id: line.id, quantity: line.quantity)
				if order_line.save
					puts "SUCCESS"
					result = true
				else
					self.errors.add('', order_line.errors.full_messages)
					result = false
				end
			end
		else
			flash.now[:error] = AlertsHelper.getErrorAlertMessages(order)
			self.errors.add('', order.errors.full_messages)
			result = false
		end
		result
	end


end
