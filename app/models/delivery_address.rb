class DeliveryAddress < ActiveRecord::Base

	belongs_to :user
	belongs_to :order

	validates :user_id, presence: :true

end
