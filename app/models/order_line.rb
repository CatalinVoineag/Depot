class OrderLine < ActiveRecord::Base

	validates_presence_of :product_id, :quantity

	belongs_to :order

end
