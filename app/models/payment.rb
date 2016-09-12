class Payment < ActiveRecord::Base

	belongs_to :user
	belongs_to :order

	#validates :amount, :card_code, :card_no, :expiration_date, :card_name, :user_id, :order_id, presence: true
#	validates :card_code, length: { is: 3 } 
	
	#validates :user_id, presence: :true
	


end
