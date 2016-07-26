class Order < ActiveRecord::Base

	#validates_presence_of :user_id, :total_price, :email

	has_many :order_lines
	has_one :delivery_address
	has_one :bill_address
	has_one :payment

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

	def create_bill_in_order(params)
		params[:order_id] = id.to_s
		params.permit!
		bill = BillAddress.new(params)
		if bill.valid?
			bill.save!
			return true
		else
			self.errors.add('', bill.errors.full_messages.join(''))
			return false
		end
	end

	def create_delivery_in_order(params)
		params[:order_id] = id.to_s
		params.permit!
		delivery = DeliveryAddress.new(params)
		if delivery.valid?
			delivery.save!
			return true
		else
			self.errors.add('', delivery.errors.full_messages.join(''))
			return false
		end
	end


end
