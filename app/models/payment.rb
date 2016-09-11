class Payment < ActiveRecord::Base

	belongs_to :user
	belongs_to :order

	#validates :amount, :card_code, :card_no, :expiration_date, :card_name, :user_id, :order_id, presence: true
#	validates :card_code, length: { is: 3 } 
	
	validates :user_id, presence: :true
	
	validate :only_one_payment_per_order


	def only_one_payment_per_order
		order = Order.find(self.order_id)
		if order.payment.nil?
			return false
		else
			self.errors.add(:payment,'You can only have one payment per order')
			return true
		end
	end

end
