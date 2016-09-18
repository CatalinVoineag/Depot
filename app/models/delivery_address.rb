class DeliveryAddress < ActiveRecord::Base

	belongs_to :user
	belongs_to :order

	validates :user_id, presence: :true
	validates :first_name, :last_name, :street_address_1, :city, :country, :postcode, :phone, presence: true 


end
