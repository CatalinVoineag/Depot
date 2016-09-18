class Order < ActiveRecord::Base

	#validates_presence_of :user_id, :total_price, :email

	has_many :order_lines
	has_one :delivery_address
	has_one :bill_address
	has_one :payment

	belongs_to :user

	validates :user_id, presence: :true

	validates :email, presence: true

	cattr_accessor :errors_in, :bulk_erorrs

	# attrs for creating order lines by copying cart lines
	ATTRS_TO_REJECT = %w(id created_at updated_at order_id user_id cart_id)

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

	def create_bill_in_order(params, action)
		params[:order_id] = id.to_s
		params.permit!
		if action.downcase == "create" 
			bill = BillAddress.new(params)
		else
			bill = self.bill_address
			bill.assign_attributes(params)
		end
		if bill.valid?
			bill.save!
			return true
		else
			bill.errors.full_messages.map { |e| self.errors.add('', e) }
			return false
		end
	end

	def create_delivery_in_order(params)
		params[:order_id] = id.to_s
		params.permit!
		if action.downcase == "create"
			delivery = DeliveryAddress.new(params)
		else
			delivery = self.delivery_address
			delivery.assign_attributes(params)
		end
		if delivery.valid?
			delivery.save!
			return true
		else
			delivery.errors.full_messages.map { |e| self.errors.add('', e) }
			return false
		end
	end

	def create_order_lines(cart)
		status = false
		cart.cart_lines.each do |line|
			oi = self.order_lines.new(line.attributes.delete_if { |k, _| ATTRS_TO_REJECT.include?(k) })
			if oi.save
				status = true
			else
				self.errors.add("", AlertsHelper.getErrorAlertMessages(oi))
			end
		end
		status		 
	end

	def create_payment(params)
		params[:order_id] = self.id
		params.permit!
		payment = Payment.new(params)
		if payment.valid?
			payment.save!
			return true
		else
			self.errors.add('', payment.errors.full_messages.join(''))
			return false
		end
	end

	def confirmation_check(models)
		flag = []
		if self.valid?
			models.each do |model|
				if self.send(model).valid?
					flag << true
				else

					self.errors.add('', self.send(model).errors.full_messages.join(' '))
					self.errors_in = model
					flag << false
				end
			end
		else
			self.errors_in = "Order"
			flag << false
		end
		return flag.include?(false) ? false : true  
	end


end
